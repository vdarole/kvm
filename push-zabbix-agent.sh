#!/bin/bash


#for SR in `cat /root/centos-server.txt`
#do
#scp /root/git-upload/kvm/zabbix-Centos-installation.sh $SR:/root
#echo "$SR transfer completed "
#ssh $SR 'sh /root/zabbix-Centos-installation.sh'
#echo "Agent install on $SR completed "
#done

for SR in `cat /root/ubuntu-server.txt`
do
scp /root/git-upload/kvm/zabbix-Ubuntu-installation.sh ansible@$SR:/tmp
echo "$SR transfer completed "
ssh ansible@$SR 'sudo sh /tmp/zabbix-Ubuntu-installation.sh'
echo "Agent install on $SR completed "
done
