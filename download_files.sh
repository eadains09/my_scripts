# download_files.sh <homework #>
# Iterates through the list of students' usernames and downloads their homeworks
# for the given asssignment, outputting errors to download-errors.txt
# $1- 1st command line argument, the homework or project number being downloaded
###############################################################


#! /bin/bash

exec 2>> download-errors.txt
exec >> download-comments.txt

while IFS='' read -r username || [[ -n "$username" ]] 
do
	echo $username
	cd ../$username
	svn co https://www.cs.usfca.edu/svn/$username/$1
	touch ${1}/${username}_${1}.txt
done < ../1_scripts/usernames.txt

# svn ls -v https://www.cs.usfca.edu/svn/$username/$1