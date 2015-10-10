# upload_grades.sh <homework #>
# Iterates through the list of students' usernames and accesses the folder where 
# their grades are stored, copies the grade to a backup file, and adds and commits 
# to their svn account.
# $1- 1st command line argument, the homework or project number being downloaded
###############################################################


#! /bin/bash

exec 2>> upload-errors.txt
exec >> upload-comments.txt

mkdir ${1}-1-graded

while IFS='' read -r username || [[ -n "$username" ]] 
do
	echo $username
	cd ../$username/$1
	cp ${username}_${1}.txt ../../../${1}-1-graded
	svn add ${username}_${1}.txt
	svn commit -m "uploading grade"
    cd ../../1_scripts
done < usernames.txt

tar czvf ${1}-1-graded.tgz ${1}-1-graded