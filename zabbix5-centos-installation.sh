#!/bin/bash
# Purpose: Zabbix Agent Installation script.
# Version: 1.0
# Created Date: 2-Sept-2022
# Modified Date:
# Author : Vallabh Darole

### Install Zabbix 4 repository ###
rpm -Uvh https://repo.zabbix.com/zabbix/5.0/rhel/7/x86_64/zabbix-release-5.0-1.el7.noarch.rpm

### Install puppet agent ###
yum install zabbix-agent2 -y

### Taking backup of configuration file ###
cp /etc/zabbix/zabbix_agent2.conf /etc/zabbix/zabbix_agentd.conf-backup

### Update the configuration file ###
sed -i 's/Server=127.0.0.1/Server=172.16.1.212/g' /etc/zabbix/zabbix_agent2.conf
sed -i 's/ServerActive=127.0.0.1/ServerActive=172.16.1.212/g' /etc/zabbix/zabbix_agent2.conf
sed -i 's/Hostname=Zabbix server/Hostname='`'hostname'`'/g' /etc/zabbix/zabbix_agent2.conf
sed -i 's/# HostMetadata=/HostMetadata=LinuxServer/g' /etc/zabbix/zabbix_agent2.conf

### Starting and Enabling zabbix agent ###
systemctl restart zabbix-agent2
systemctl enable zabbix-agent2
