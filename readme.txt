#response.sh
#author: Munashe Zanza
A Linux live collection tool

*IT IS REQUIRED THAT YOU RUN THIS PROGRAM AS ROOT using command 'sudo su' in command line beforehand 

##Running response.sh 
- Execute via command line using commands 'sudo response.sh' or 'sh response.sh' and when prompted for a case name, enter one of your choice
- The tools folder must be in the same directory as response.sh 
- If successful the first time and running again you may encounter the error 'insmod: ERROR: could not insert module ' to remove this, run 'sudo rmmod lime' and try again. The script should do this on its own, however.

##Output Folder
- All output will be in the data folder within the directory in the $location variable. The script will create this folder automatically when run if it is not already present
- Evidence md5 hashes are stored in hashes.txt
- Case information including start time of investigation and end time of investigation, person investigsting, tools and case name are in the Case_Info text file in the data folder


When using LiME it is important that the version of LiME you are running corresponds to your kernel, this can be found by executing 'uname -a' in the terminal and then editing the lime*generic.ko (where the * represents the kernel number) code in your LiME folder . At current, the LiME kernel version in Tools is set to 5.15.0-69 in the tools folder
