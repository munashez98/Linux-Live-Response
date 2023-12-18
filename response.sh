#!/bin/bash
#Response script by Munashe Zanza
#Run this program as root user
#Run this proglam from its own directory ./


clear 

echo "This is a script to collect Ubuntu live response data" #returns text between quotation marks

read -p "Do you want to begin? [Y/n]" user_answer #prompt user for response and store in variable user_answer

case $user_answer in
Y|y|YES|yes|Yes) echo " ";;
N|n|NO|no|No) exit;;
*) echo "You must answer yes or no";read -p "Press any key to continue";clear;exit
esac #most operations such as case are terminated with that command backwords

read -p "Your name?" person #prompts you for name and assigns it to person variable
read -p "Case Name?" case_name #prompts you for case name and assigns it to name_case

computer_date1=`date` #assigns current date to variable computer_date. This is the start time
location=`pwd` #pwd gets current directory. this command assigns output of pwd to location variable

data=$location/data

#if a directory exists called data exists it returns "Writing to <path of $data>"" else it makes the directory and returns "<path of $data> created"
if [ -d "$data" ] 
then
	echo "Writing to $data"
else
	mkdir $data
	echo "$data created"

fi


echo "Collecting Date Info"
$location/tools/date >> $location/data/$case_name.date #runs date command from tools folder and outputs to $collect folder as <case name.date.txt>

echo "Collecting Hostname"
$location/tools/hostname >> $location/data/$case_name.hostname #runs hostname command from tools folder and outputs to $data folder as <case name.hostname.txt>



### LiME ##

#Run LiME and output to the specified data folder

echo "Running LiME" #runs LiME for volatile memory collection

lime_command1='$location/tools/insmod $location/tools/LiME/src/lime-5.15.0-69-generic.ko "path=$data/LiME.dmp format=raw"' # Make sure the LiME version you're running is correct
eval "$lime_command1"
$location/tools/rmmod lime


echo "Collecting ARP cache info"
$location/tools/arp -a > $location/data/$case_name.arp #record arp cache

echo "Collecting port info"
$location/tools/netstat -np >> $location/data/$case_name.open_connected_ports #list all open and connected ports
$location/tools/netstat -np >> $location/data/$case_name.listening_ports #list all listening ports

echo "Collecting interface information and Hardware Address"
$location/tools/ifconfig >> $location/data/$case_name.interfaces #collect and output interface information, and MAC address to interfaces file



echo "Listing open files"
$location/tools/ls -lsof >> $location/data/$case_name.open_files #list all open files

echo "Collecting Directory listing"
$location/tools/ls -alhR >> $location/data/$case_name.dir 2>$location/data/$case_name.direrr #runs ls command from tools folder and outputs to $data folder as <case name.dir.txt>. Errors will go to <case name.direrr.txt>

echo "Copying etc/passwd"
$location/tools/cp /etc/passwd $location/data/ #copies list of users to $data directory


#if found copies file system table of devices and mount points to $data
{
if [ -d ./etc/fstab ] 
then
        echo "Copying etc/fstab"
        cp /etc/fstab $location/data
        exit 0

fi

}


# if found copies list of users with elevated privileges to $data
{
if [ -d ./etc/fstab ] 
then
        echo "Collecting list of users with elevated privileges"
        cp /etc/sudoers $location/data
        exit 0

fi

}


echo "Collecting list of running processes"
$location/tools/ps -aux >> $location/data/$case_name.running_processes #copies list of running processes and outputs to case name.running_processes.txt

echo "Copying logs"
$location/tools/cp -R /var/log $location/data/ #copies logs to $data

echo "Checking memory information"
$location/tools/free >> $location/data/$case_name.free_memory #outputs memory information

computer_date2=`date` #assigns current date to variable computer_date. This is the end time

echo "Getting md5 Hashes of files and copying to $hashes.txt in data folder..."

#Generate file hashes and output to hashes.txt
$location/tools/find $location/data -type f ! -iname "*.dmp" -exec $location/tools/md5sum {} + > $location/data/hashes.txt

#Output case info to Case_Info.txt, including date, name of investigator, and case name
echo "Start time: $computer_date1" > $location/data/Case_Info.txt
echo "Investigator: $person" >> $location/data/Case_Info.txt
echo "Case name: $case_name" >> $location/data/Case_Info.txt
echo "End time: $computer_date2 \n" >> $location/data/Case_Info.txt
echo "Tools Used:" >> $location/data/Case_Info.txt
$location/tools/ls $location/tools/ >> $location/data/Case_Info.txt
echo "Done, Case Information can be found in the Case_Info.txt file"











