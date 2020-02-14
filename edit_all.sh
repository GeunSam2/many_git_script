#!/bin/bash

#####
#VARS
#####
run1=$1
message1=$2
message2=$3


list1=$(cat ./list-api.txt)
list2=$(cat ./list-fr.txt)
list3=$(cat ./list-all.txt)
list4=$(cat ./list-test.txt)
flist=blank

#####
#Functions
#####

function replace_func1() {
	for name in ${flist}
	do
		echo replaceing ${name}
		sed -i ${message1} ${name}/${message2}
	done
}

function replace_check_func1() {
	for name in ${flist}
	do
		echo replaceing ${name}
		sed ${message1} ${name}/${message2}
	done
}

echo -n '''
------------------
Select list to use
1. list-api
2. list-fr
3. list-all
4. list-test
------------------
Enter your Selection : '''
read listselect
case ${listselect} in
    "1") flist=${list1};;
    "2") flist=${list2};;
    "3") flist=${list3};;
    "4") flist=${list4};;
esac

case ${run1} in
	replace) replace_func1 ;;
	replace_check) replace_check_func1 ;;
	*) echo wrong parameter ;;
esac
