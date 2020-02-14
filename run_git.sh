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
function reclone(){
	for name in ${list1}
	do
		echo removing ${name}
		rm -rf ./${name}
		echo cloning ${name}
		git clone http://128.11.1.68:10100/CJL-GLOBAL/${name}.git
	done
}

function pull_func1(){
	for name in ${list1}
	do
		echo pulling ${name}
		cd ${name}
		git pull ${message1} ${message2}
		cd ../
	done	
}

function commit_func1(){
	for name in ${list1}
	do
		echo adding stage ${name}
		cd ${name}
		git add .
		echo commiting ${name}
		git commit -am "${message1}"
		cd ../
	done
}

function push_func1(){
	for name in ${list1}
	do
		echo pushing ${name}
		cd ${name}
		git push ${message1} ${message2}
		cd ../
	done
}

function checkout_func1(){
	for name in ${list1}
	do
		echo checkout branch ${name}
		cd ${name}
		git checkout ${message1}
		cd ../		
	done
}

function uncommit() {
	for name in ${list1}
	do
		echo uncommiting ${name}
		cd ${name}
		git reset --hard HEAD^
		cd ../
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
	pull) pull_func1 ;;
	commit) commit_func1 ;;
	push) push_func1 ;;
	checkout) checkout_func1 ;;
	reclone) reclone ;;
	uncommit) uncommit ;;
	*) echo wrong parameter ;;
esac
