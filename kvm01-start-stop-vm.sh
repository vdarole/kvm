#!/bin/bash
# Purpose: To Start and Shutdown the VMS
# Version: 1.0
# Created Date: 7 Sept 2022
# Modified Date: 6 March 2023
# Author : Vallabh Darole

echo
echo "1. START ALL VIRTUAL MACHINE "
echo "2. STOP ALL VIRTUAL MACHINE"
echo "3. Quit"
echo "Please select the option:"
read STATUS

echo "VM are " $STATUS `date` >> /root/vm-logs.txt

## Below tasks is to start the VM

case $STATUS in
"1")
virsh start lamp01
sleep 2
virsh start zap01
sleep 2
virsh start pup01

## Below to check the status

virsh list

;;

## Below tasks are to shutdown the VM
"2")
virsh shutdown lamp01
sleep 2
virsh shutdown zap01
sleep 2
virsh shutdown pup01


## Below to check the status
virsh list --all

;;
"3") exit
;;
*) echo "$STATUS is not a valid option"
;;
esac


