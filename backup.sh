#! /bin/bash

backupdirectory=/opt/Backup/
backuptoolkitdirectory=/opt/Backup/Toolkit/

backupmiscdirectory=$backuptoolkitdirectory/Misc/
backupscriptdirectory=$backuptoolkitdirectory/Scripts/
backuptooldirectory=$backuptoolkitdirectory/Tools/

currenttoolkitdirectory=/opt/Toolkit/

rm -rf $backupdirectory/*
mkdir -p $backupscriptdirectory $backupmiscdirectory $backuptooldirectory

cp /usr/bin/scan $backupscriptdirectory
cp '/root/.zshrc' $backupscriptdirectory/zshrc

cp -r $currenttoolkitdirectory/* $backuptoolkitdirectory

tar -czf $backupdirectory/backuptoolkit.tar.gz -C $backuptoolkitdirectory .
