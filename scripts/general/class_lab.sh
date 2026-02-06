#!/bin/bash

# List all running nginx processes
ps aux | grep nginx

# Kill all processes named my_script.sh
pkill -f my_script.sh

# Run backup.sh in the background and keep it running after logout
nohup ./backup.sh &

# Extract only the PID of the sshd daemon
pidof sshd

# View process hierarchy in a tree format
pstree -p

# List all open files for process with PID 1234
lsof -p 1234

# Check if docker daemon is active using systemd
systemctl status docker

# Run heavy_calc.sh with lowest CPU priority
nice -n 19 ./heavy_calc.sh


echo "=== Files, Copying & Archiving ==="

# Recursively copy /var/www/html to /backup/html
cp -r /var/www/html /backup/html

# Copy secret.key to /tmp preserving all attributes
cp -a secret.key /tmp/

# Sync src/ to dest/, copying only newer or missing files
rsync -av --ignore-existing src/ dest/

# Copy files only if source is newer
cp -ru dir1/ dir2/

# Copy app.conf to a remote server using scp
scp app.conf user@192.168.1.50:/etc/

# Create a compressed tar archive of /var/log
tar -czvf logs_backup.tar.gz /var/log


echo "=== The find Command ==="

# Find files larger than 500MB in /home
find /home -type f -size +500M

# Find files modified in the last 7 days in /var/log
find /var/log -type f -mtime -7

# Find files owned by user jenkins in /tmp
find /tmp -user jenkins

# Find and delete empty directories in /data
find /data -type d -empty -delete

# Find files with 777 permissions in current directory
find . -type f -perm 777

# Find .jpg files and copy them to /images
find . -type f -name "*.jpg" -exec cp {} /images/ \;


echo "=== Regular Expressions (grep, sed, awk) ==="

# Extract email addresses from contacts.txt
grep -E "[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}" contacts.txt

# Case-insensitive search for "error" in syslog
grep -i "error" syslog

# Find lines starting with "root" in config.ini
grep "^root" config.ini

# Show lines NOT containing a specific IP
grep -v "192.168.1.1" access.log

# Recursively search for TODO in all files
grep -R "TODO" .

# Replace localhost with 127.0.0.1 in hosts.txt
sed -i 's/localhost/127.0.0.1/g' hosts.txt

# View config file without commented lines
grep -v "^#" config.conf

# Find IPv4 addresses in a file
grep -E "\b([0-9]{1,3}\.){3}[0-9]{1,3}\b" file.txt


echo "=== Complex Combinations ==="

# Show processes running as root
ps aux | grep "^root"

# Find .log files containing the word "Critical"
find . -name "*.log" -exec grep -l "Critical" {} \;
