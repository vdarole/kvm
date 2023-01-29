#!/bin/bash


for SR in `cat /root/centos-server.txt`
do
scp /root/project-data/puppet-agent-installation.sh $SR:/root
echo "$SR transfer completed "
ssh $SR 'sh /root/puppet-agent-installation.sh'
echo "Agent install on $SR completed "
done

for SR in `cat /root/ubuntu-server.txt`
do
scp /root/project-data/ubuntu-puppet-agent-installation.sh vallabh@$SR:/tmp
echo "$SR transfer completed "
ssh ansible@$SR 'sudo sh /tmp/puppet-agent-installation.sh'
echo "Agent install on $SR completed "
done
