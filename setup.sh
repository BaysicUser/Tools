#!/bin/bash

read -p "Enter list of IPs (separated by spaces): " -a Targets

echo "You entered the following items:"
for Target in "${Targets[@]}"; do
  echo "- $Target"
  mkdir -p /opt/Targets/$Target
  #touch /opt/Targets/$Target/.env
  echo "export TARGET_IP='$Target'" >> /opt/Targets/$Target/.env

done


