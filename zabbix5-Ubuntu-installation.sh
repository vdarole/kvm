#!/bin/bash
# Purpose: Zabbix Agent 5 Installation script.
# Version: 1.0
# Created Date: 2-Sept-2022
# Modified Date:
# Author : Vallabh Darole

### Install Zabbix 5 repository ###
wget https://repo.zabbix.com/zabbix/5.0/ubuntu/pool/main/z/zabbix-release/zabbix-release_5.0-1%2Bbionic_all.deb 
### Install zabbix agent ###

sudo dpkg -i zabbix-release_5.0-1+bionic_all.deb
sudo apt update
sudo apt install zabbix-agent2

### Taking backup of configuration file ###
cp /etc/zabbix/zabbix_agent2.conf /etc/zabbix/zabbix_agentd.conf-backup

### Update the configuration file ###
sed -i 's/Server=127.0.0.1/Server=172.16.1.212/g' /etc/zabbix/zabbix_agent2.conf
sed -i 's/ServerActive=127.0.0.1/ServerActive=172.16.1.212/g' /etc/zabbix/zabbix_agent2.conf
sed -i 's/Hostname=Zabbix server/Hostname='`'hostname'`'/g' /etc/zabbix/zabbix_agent2.conf
sed -i 's/# HostMetadata=/HostMetadata=LinuxServer/g' /etc/zabbix/zabbix_agent2.conf
echo "Plugins.Docker.Endpoint=unix:///var/run/docker.sock " >> /etc/zabbix/zabbix_agent2.conf
### Starting and Enabling zabbix agent ###
systemctl restart zabbix-agent2
systemctl enable zabbix-agent2
