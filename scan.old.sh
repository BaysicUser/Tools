#!/bin/bash

var_Now=`date '+%F_%H:%M'`

rm -rf /opt/HTB/;
mkdir -p /opt/HTB/scanresults_$var_Date/ && cd $_
#cd /opt/HTB/scan/;

#Run scans
echo -e "
\n*****************************
***Running quick port scan***
*****************************\n"

ports=$(nmap -p- --min-rate=1000 -Pn -T4 $1 | grep ^[0-9] | cut -d '/' -f 1 | tr '\n' ',' | sed s/,$//)
nmap -Pn -sC -sV -p$ports $1 -oN $1_quickscan.txt;
echo -e "***Quick port scan completed***\n"

echo -e "***Running Autorecon***\n";
autorecon $1 -p $ports;
echo -e "***Autorecon completed***\n";


<<com

echo "Running quick port scan"
nmap -sS -T4 -p- $1 -oN $1_quickscan.txt;
echo "Quick port scan completed";
cat $1_quickscan.txt;

echo "Running version and script scan";
nmap -sCV -vv -T4 -p- $1 -oA $1_sCV_AllPorts;
echo "Version and script scan completed";
cat $1_sCV_AllPorts;

echo "Running Autorecon";
autorecon $1;
echo "Autorecon completed";
com
