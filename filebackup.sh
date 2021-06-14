#written by Patrick Ross

#!/bin/bash
backupdir=/home/user/test/$(date +"%Y%m%d")releasebackup
apps+=( "test.txt" "test2.txt" )
dir=/home/user/test

#checks existance of backup directory and creates it if not present
check_dir(){
if [ -d "$backupdir" -a ! -h "$backupdir" ]
then echo "Dir found"
else "Directory not found, creating"
mkdir $dir/$(date +"%Y%m%d")releasebackup
fi
}

#finds files and copy into backup backupdir
copy_files(){
for x in ${apps[@]}; do
find $dir -maxdepth 1 -type f -name $x -exec cp {} $backupdir \;
done
}

list_files(){
  ls -l $backupdir
}

#main script

check_dir
echo "backup directory created"
copy_files
echo "files copied"
list_files
exit
