#!/bin/bash

sudo apt update && sudo apt full-upgrade -y

# For MAC VMs Only
#  sudo apt install dkms
#  sudo apt install libelf-dev
#  sudo mount -o exec /dev/sr0 /media/cdrom

#Delete default SSH keys
rm -f /etc/ssh/ssh_host_*
dpkg-reconfigure openssh-server

#Move RC file
mv ~/.zshrc ~/.zshrc.bak
mv /opt/Tools/zshrc.bak ~/.zshrc

chmod +x /opt/Tools/scan.sh && mv /opt/Tools/scan.sh /usr/bin/scan

#Install Fonts
echo "#### Installing Fonts ####"

mkdir Fonts
unzip Fonts.zip -d Fonts
cp ./Fonts/*.ttf /usr/share/fonts/truetype/
cp ./Fonts/*.ttf /usr/share/fonts/opentype/

#Install Common Tools
echo "#### Installing Common Tools ####"
sudo apt install python3
sudo apt install python3-pip
sudo apt install seclists curl dnsrecon enum4linux feroxbuster gobuster impacket-scripts nbtscan nikto nmap onesixtyone oscanner redis-tools smbclient smbmap snmp sslscan sipvicious tnscmd10g whatweb wkhtmltopdf -y
sudo apt install jd-gui -y
sudo apt install xclip -y

#Install pipx
sudo apt install python3-venv
python3 -m pip install --user pipx
python3 -m pipx ensurepath

# Libreoffice
#sudo apt-get install libreoffice

# Install Sublime Text
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo tee /etc/apt/keyrings/sublimehq-pub.asc > /dev/null
echo -e 'Types: deb\nURIs: https://download.sublimetext.com/\nSuites: apt/stable/\nSigned-By: /etc/apt/keyrings/sublimehq-pub.asc' | sudo tee /etc/apt/sources.list.d/sublime-text.sources
sudo apt-get update
sudo apt-get install sublime-text

# Recon Tools
echo "#### Downloading Recon Tools ####"

mkdir -p /opt/Tools/Recon/ && cd /opt/Tools/Recon/
git clone https://github.com/codingo/Reconnoitre.git
cd /opt/Tools/Recon/Reconnoitre
python3 setup.py install

sudo apt install autorecon -y
sudo apt install getsploit -y
sudo apt install sploitscan -y
pip3 install scrapy
wget -O ReconSpider.zip https://academy.hackthebox.com/storage/modules/144/ReconSpider.v1.2.zip
unzip ReconSpider.zip

git clone https://github.com/thewhiteh4t/FinalRecon.git
cd FinalRecon
pip3 install -r requirements.txt
chmod +x ./finalrecon.py

#git clone https://github.com/FortyNorthSecurity/EyeWitness
sudo apt install eyewitness -y
#git clone https://github.com/michenriksen/aquatone
mkdir Aquatone && cd Aquatone/
wget https://github.com/michenriksen/aquatone/releases/download/v1.7.0/aquatone_linux_amd64_1.7.0.zip
unzip aquatone_linux_amd64_1.7.0.zip
cp aquatone /usr/bin/

git clone https://github.com/21y4d/nmapAutomator.git
#sudo ln -s $(pwd)/nmapAutomator/nmapAutomator.sh /usr/local/bin/

#Enumeration Web Apps
git clone https://github.com/yogeshojha/rengine

#Enumeration Linux Scripts
echo "#### Downloading Linux Enum Scripts ####"

mkdir -p /opt/Tools/Enumeration/Linux/ && cd /opt/Tools/Enumeration/Linux/
git clone https://github.com/rebootuser/LinEnum.git
git clone https://github.com/jondonas/linux-exploit-suggester-2.git
git clone https://github.com/CiscoCXSecurity/enum4linux
git clone https://github.com/cddmp/enum4linux-ng
wget https://github.com/carlospolop/PEASS-ng/releases/latest/download/linpeas.sh
wget https://github.com/peass-ng/PEASS-ng/releases/download/20240421-825f642d/linpeas.sh
wget https://github.com/peass-ng/PEASS-ng/releases/download/20240421-825f642d/linpeas_linux_amd64

#Enumeration: Windows Scripts
echo "#### Downloading Windows Enum Scripts ####"


mkdir -p /opt/Tools/Enumeration/Windows/ && cd /opt/Tools/Enumeration/Windows/
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

#Enumeration: Credential Tools
mkdir -p /opt/Tools/Enumeration/Creds/ && cd /opt/Tools/Enumerations/Creds/
pip3 install defaultcreds-cheat-sheet
pip3 install pypykatz
git clone https://github.com/AlessandroZ/LaZagne
git clone https://github.com/huntergregal/mimipenguin
git clone https://github.com/unode/firefox_decrypt
git clone https://github.com/urbanadventurer/username-anarchy.git
git clone https://github.com/digininja/RSMangler.git
git clone https://github.com/sc0tfree/mentalist.git
sudo apt install cupp

#Download AD Tools
echo "#### Downloading AD Tools ####"

mkdir -p /opt/Tools/AD/ && cd /opt/Tools/AD/
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
git clone https://github.com/sosdave/KeyTabExtract
git clone https://github.com/CiscoCXSecurity/linikatz
git clone https://github.com/CravateRouge/bloodyAD?tab=readme-ov-file
git clone https://github.com/yaap7/ldapsearch-ad.git

#Lateral Movement
git clone https://github.com/Kevin-Robertson/Invoke-TheHash.git

#Download C2s
echo "#### Downloading C2s ####"

mkdir -p /opt/Tools/C2/ && cd /opt/Tools/C2/
git clone https://github.com/HavocFramework/Havoc.git
git clone https://github.com/its-a-feature/Mythic.git
cd Mythic
sudo ./install_docker_kali.sh
apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common

#Docker Config
echo "deb [arch=amd64 signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/debian bookworm stable" | \ sudo tee /etc/apt/sources.list.d/docker.list 
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg 
apt-get install -y --no-install-recommends docker-ce docker-compose-plugin

<<com
cd /opt/Tools/C2/Mythic/
sudo apt-get install make
sudo make
sudo ./mythic-cli install github https://github.com/MythicAgents/Apollo
sudo ./mythic-cli install github https://github.com/MythicAgents/Athena
sudo ./mythic-cli install github https://github.com/MythicAgents/bloodhound
sudo ./mythic-cli install github https://github.com/MythicC2Profiles/http
sudo ./mythic-cli install github https://github.com/MythicC2Profiles/dns
com

#Obfuscation Tools
git clone https://github.com/mgeeky/ProtectMyTooling

#Download Visual Studio
cd /opt/Tools/
/n
/n
echo Installing Downloading Visual Studio
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
sudo install -o root -g root -m 644 microsoft.gpg /etc/apt/trusted.gpg.d/
echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" | sudo tee /etc/apt/sources.list.d/vscode.list
sudo apt update && sudo apt install code

# Tunnel Tools
echo "####Installing Tunneling Tools####"
/n
/n
sudo apt install ligolo-ng

#mkdir /opt/Tools/Tunneling/ && cd /opt/Tools/Tunneling/
#wget https://github.com/nicocha30/ligolo-ng/releases/download/v0.5.2/ligolo-ng_agent_0.5.2_linux_amd64.tar.gz
#wget https://github.com/nicocha30/ligolo-ng/releases/download/v0.5.2/ligolo-ng_agent_0.5.2_windows_amd64.zip

# Additional Resources and Tools
echo "####Downloading Other Tools####"
cd /opt/Tools/
python3 -m pipx install impacket
git clone https://github.com/swisskyrepo/PayloadsAllTheThings.git
git clone https://github.com/t3l3machus/psudohash.git
git clone https://github.com/t3l3machus/PowerShell-Obfuscation-Bible.git
git clone https://github.com/DanMcInerney/net-creds.git
wget -c https://github.com/RustScan/RustScan/archive/refs/tags/2.1.1.tar.gz -O Rustscan.tar.gz
wget https://code.visualstudio.com/docs/?dv=linux64_deb
wget http://www.dest-unreach.org/socat/download/socat-1.8.0.0.tar.gz
sudo apt install gowitness
sudo apt install netexec
sudo apt install hexedit

# Exploit Tools
mkdir /opt/Tools/NetExec/ && cd /opt/Tools/NetExec/
wget https://github.com/Pennyw0rth/NetExec/releases/download/v1.1.0/nxc
wget https://github.com/Pennyw0rth/NetExec/releases/download/v1.1.0/nxc.exe

#Exfiltration
mkdir /opt/Tools/Exfil/ && cd /opt/Tools/Exfil/
git clone https://github.com/iagox86/dnscat2.git

#Download Pimpmykali
Echo Downloading Pimpmykali
cd /opt/Tools/
git clone https://github.com/Dewalt-arch/pimpmykali.git
sudo /opt/Tools/pimpmykali/pimpmykali.sh

<<com

https://github.com/gtworek/Priv2Admin
https://www.thehacker.recipes/
https://www.ired.team/

com
