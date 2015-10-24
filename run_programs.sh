# run_programs.sh <homework #>
# Iterates through the list of students' usernames and compiles and runs any .c
# files located in folder of homework number.
# $1- 1st command line argument, the homework or project number being run
###############################################################


#! /bin/bash

#exec 2>> run-errors.txt
exec >> run-comments.txt 2>&1

while IFS='' read -r username || [[ -n "$username" ]] 
do
    echo; echo; echo $username
	cd ../$username/$1
    if gcc -g -Wall -o test_homework l*.c; then
        echo; echo "test homework 1st case"; echo
        ./test_homework <<< "i3 i1 i2 i3 p d4 p q"

        echo; echo; echo "test homework 2nd case"; echo
        ./test_homework <<< "i3 i1 i2 i3 p d2 p q"

        echo; echo; echo "test homework 3rd case"; echo
        ./test_homework <<< "i3 i1 i2 i3 p d3 p q"

        echo; echo; echo "test homework 4th case"; echo
        ./test_homework <<< "i3 i1 i2 i3 p d3 d3 p q"
    else
        echo "Could not compile homework" 1>&2
    fi
	cd ../../1_scripts
done < usernames.txt
