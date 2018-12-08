# OLT-Fiberhome
Backup FTP on OLT Fiberhome


Simple shell script that performs telnet backup on Fiberhome OLTs.

Usage : ./backupOltFiberhome.sh 192.168.50.2
Crontab example: 10 00 * * *     root    sh /home/yourdirectory/backupOltFiberhome.sh 192.168.50.2 > /dev/null 2>&1
