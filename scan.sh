#!/bin/bash

if [ -z "$1" ]; then
    echo "Usage: $0 <target|target-file>"
    exit 1
fi

INPUT=$1

TIME="$(date +"%T")"
HOMEDIR="/opt/OSCP"
OUTDIR="scan_$TIME"
mkdir -p $HOMEDIR/$OUTDIR

# Scan speed flags
SPEED_FLAGS="--open -Pn -T4 --min-rate 200 --max-retries 4"
UDP_SPEED_FLAGS="--open -Pn -T4 --min-rate 200 --max-retries 4 --top-ports 1000 --defeat-rst-ratelimit"

# If argument is a file, treat as a list of targets
if [ -f "$INPUT" ]; then
    TARGETS=$(cat "$INPUT")
else
    TARGETS="$INPUT"
fi

for TARGET in $TARGETS; do
    
    mkdir -p "$HOMEDIR/$OUTDIR/$TARGET/"
    TARGETDIR="$HOMEDIR/$OUTDIR/$TARGET"
    mkdir -p "$TARGETDIR"/Aquatone/
    TCP_OUT="$TARGETDIR/$TARGET"'_tcp_open_ports.txt'
    UDP_OUT="$TARGETDIR/$TARGET"'_udp_open_ports.txt'
    
    echo
    echo -e "\e[0;32m======================================================\e[0m"
    echo -e "\e[0;32m[*] Scanning: $TARGET   Start Time: $TIME\e[0m"
    echo -e "\e[0;32m======================================================\e[0m"
    echo

    

    echo -e "[*] Discovering open TCP ports on $TARGET..."
    
    TCP_PORTS=$(nmap -p- $SPEED_FLAGS $TARGET | grep ^[0-9] | cut -d '/' -f 1 | tr '\n' ',' | sed s/,$//)
    
    printf "$TCP_PORTS" >> $TCP_OUT

    echo -e "[*] Discovering open UDP ports on $TARGET..."
    
    UDP_PORTS=$(nmap -sU $UDP_SPEED_FLAGS $TARGET | grep ^[0-9] | cut -d '/' -f 1 | tr '\n' ',' | sed s/,$//)
    
    printf "$UDP_PORTS" >> $UDP_OUT

    echo -e "[*] TCP Ports Found: $TCP_PORTS"
    echo -e "[*] UDP Ports Found: $UDP_PORTS"
    echo 

    # Version scans
    #if [ -n "$TCP_PORTS" ]; then
    if [ -n "$TCP_PORTS" ] || [ -n "$UDP_PORTS" ]; then
        echo -e "\e[0;32m[*] Running service version detection...\e[0m"
        echo
        #nmap -sV -p "$TCP_PORTS" $SPEED_FLAGS "$TARGET" \
        nmap -sS -sU -sV -p T:"$TCP_PORTS",U:"$UDP_PORTS" $SPEED_FLAGS "$TARGET" \
            -oN "$TARGETDIR/$TARGET"'_version_scan.txt' -oX "$TARGETDIR/$TARGET"'_version_scan.xml'
    fi

    # Run Aquatone
    echo 
    echo 
    echo -e "\e[0;32m[*] Running Aquatone...\e[0m"
    $echo
    cd "$TARGETDIR"/Aquatone/
    cat "$TARGETDIR"/"$TARGET"_version_scan.xml | aquatone -nmap
    cd $TARGETDIR

    # NSE vulnerability scan
    if [ -n "$TCP_PORTS" ] || [ -n "$UDP_PORTS" ]; then
        #COMBINED_PORTS=$(echo "$TCP_PORTS,$UDP_PORTS" | sed 's/^,//;s/,$//;s/,,/,/')
        echo 
        echo 
        echo -e "\e[0;32m[*] Running NSE vulnerability scan...\e[0m"
        echo
        nmap -sS -sU -sV --script=vuln -p T:"$TCP_PORTS",U:"$UDP_PORTS" $SPEED_FLAGS "$TARGET" -oN "$TARGET"'_vuln_scan.txt'
    else
        echo -e "\e[0;32m[!] No open ports found. Skipping NSE vuln scan.\e[0m"
    fi

    echo
    echo
    enum4linux-ng -A $TARGET -oJ "$TARGETDIR/$TARGET"'_enum4linux'
    echo
    echo

done;

TIME="$(date +"%T")"

echo -e "\e[0;32m======================================================\e[0m"
echo -e "\e[0;32m[*] Initial scans completed. End Time: $TIME\e[0m"
echo -e "\e[0;32m[*] Output saved in directory: $OUTDIR\e[0m"
echo -e "\e[0;32m======================================================\e[0m"


# Run Autorecon
echo
echo -e "\e[0;32m[*] Running Autorecon...\e[0m"
echo
mkdir -p $HOMEDIR/Autorecon
autorecon -t "$HOMEDIR"/targets.txt -o $HOMEDIR/Autorecon

# echo -e "\e[0;32mtext\e[0m"
