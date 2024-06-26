#!/bin/bash

#Delete default SSH keys
cd /etc/ssh/
rm -f ssh_host_*
dpkg-reconfigure openssh-server


#Make Directories
mkdir /opt/Tools/
mkdir /opt/Scripts/

#Install Common Tools
sudo apt install python3
sudo apt install python3-pip
sudo apt install seclists curl dnsrecon enum4linux feroxbuster gobuster impacket-scripts nbtscan nikto nmap onesixtyone oscanner redis-tools smbclient smbmap snmp sslscan sipvicious tnscmd10g whatweb wkhtmltopdf

#Install pipx
sudo apt install python3-venv
python3 -m pip install --user pipx
python3 -m pipx ensurepath

echo Installing impacket
python3 -m pipx install impacket

#Download Scan Tools
echo Download Scanning Tools
sudo apt install autorecon

#Download Linux Enum Scripts
echo Downloading Linux Enum Scripts
mkdir /opt/Tools/Enumeration/Linux/ && cd /opt/Tools/Enumeration/Linux/
git clone https://github.com/rebootuser/LinEnum.git
git clone https://github.com/jondonas/linux-exploit-suggester-2.git
git clone https://github.com/CiscoCXSecurity/enum4linux
git clone https://github.com/cddmp/enum4linux-ng
wget https://github.com/carlospolop/PEASS-ng/releases/latest/download/linpeas.sh
wget https://github.com/peass-ng/PEASS-ng/releases/download/20240421-825f642d/linpeas.sh
wget https://github.com/peass-ng/PEASS-ng/releases/download/20240421-825f642d/linpeas_linux_amd64

#Download Windows Enum Scripts
echo Downloading Windows Enum Scripts
mkdir /opt/Tools/Enumeration/Windows/ && cd /opt/Tools/Enumeration/Windows/
git clone https://github.com/carlospolop/privilege-escalation-awesome-scripts-suite/tree/master/winPEAS
git clone https://github.com/GhostPack/Seatbelt.git
git clone https://github.com/rasta-mouse/Sherlock.git
git clone https://github.com/PowerShellMafia/PowerSploit.git
git clone https://github.com/411Hall/JAWS.git
git clone https://github.com/Tib3rius/windowsprivchecker.git
git clone https://github.com/AonCyberLabs/Windows-Exploit-Suggester.git
wget https://github.com/peass-ng/PEASS-ng/releases/download/20240421-825f642d/winPEAS.bat
wget https://github.com/peass-ng/PEASS-ng/releases/download/20240421-825f642d/winPEASx64.exe
wget https://github.com/peass-ng/PEASS-ng/releases/download/20240421-825f642d/winPEASx86.exe

#Download AD Tools
echo Downloading AD Tools
mkdir /opt/Tools/AD/ && cd /opt/Tools/AD/
git clone https://github.com/BloodHoundAD/BloodHound.git
git clone https://github.com/dafthack/DomainPasswordSpray.git
git clone https://github.com/ropnop/kerbrute
git clone https://github.com/Kevin-Robertson/Inveigh/blob/master/Inveigh.ps1
git clone https://github.com/GhostPack/Rubeus
git clone https://github.com/leoloobeek/LAPSToolkit
git clone https://github.com/adrecon/ADRecon
git clone https://github.com/ropnop/windapsearch
git clone https://github.com/BloodHoundAD/BloodHound/tree/master/Collectors
git clone https://github.com/FSecureLABS/SharpGPOAbuse.git

#Download C2s
echo Downloading C2s
mkdir /opt/Tools/C2/ && cd /opt/Tools/C2/
git clone https://github.com/HavocFramework/Havoc.git


#Download Visual Studio
cd /opt/Tools/
echo Downloading Visual Studio


#Download Tunnel Tools
echo "####Installing Tunneling Tools####"
/n
/n
sudo apt install ligolo-ng

#mkdir /opt/Tools/Tunneling/ && cd /opt/Tools/Tunneling/
#wget https://github.com/nicocha30/ligolo-ng/releases/download/v0.5.2/ligolo-ng_agent_0.5.2_linux_amd64.tar.gz
#wget https://github.com/nicocha30/ligolo-ng/releases/download/v0.5.2/ligolo-ng_agent_0.5.2_windows_amd64.zip

#Download Additional Resources and Tools
echo Downloading Other Tools 
cd /opt/Tools/
git clone https://github.com/swisskyrepo/PayloadsAllTheThings.git
git clone https://github.com/t3l3machus/psudohash.git
git clone https://github.com/t3l3machus/PowerShell-Obfuscation-Bible.git
git clone https://github.com/iagox86/dnscat2.git
git clone https://github.com/DanMcInerney/net-creds.git
wget -c https://github.com/RustScan/RustScan/archive/refs/tags/2.1.1.tar.gz -O Rustscan.tar.gz
wget https://code.visualstudio.com/docs/?dv=linux64_deb
wget http://www.dest-unreach.org/socat/download/socat-1.8.0.0.tar.gz
sudo apt install gowitness
sudo apt install netexec
pip3 install defaultcreds-cheat-sheet

#Exploit Tools
sudo apt install getsploit
sudo apt install sploitscan


mkdir /opt/Tools/NetExec/
cd /opt/Tools/NetExec/
wget https://github.com/Pennyw0rth/NetExec/releases/download/v1.1.0/nxc
wget https://github.com/Pennyw0rth/NetExec/releases/download/v1.1.0/nxc.exe


#Download Pimpmykali
Echo Downloading Pimpmykali
cd /opt/Tools/
git clone https://github.com/Dewalt-arch/pimpmykali.git
sudo /opt/Tools/pimpmykali/pimpmykali.sh
