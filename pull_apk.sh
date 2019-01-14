#!/bin/bash

echo pulling apk
echo give package name
read test
#echo This is some variable $test

function log()
{
	date '+%h-%m %X' >> log.txt
	echo $1 >> log.txt
	echo $1
}

function device_on()
{
	echo device testing!
}

function package_valid()
{
	echo $(execute "adb shell pm path $1")
}

function execute()
{
	eval $1
	result="($1)"
}

function rename()
{
	echo $(execute "mv base.apk $1")
}

function pull_apk()
{
	#check device working
	if device_on; then
		echo execute cmd
	else
		echo device off!
	fi
	
	#check package name
	path="$(package_valid $1)"
	if [[ -z $path ]]; then
		log "invalid package - $1!"
	else
		log "located valid package - $1"
		len=${#path}
		echo ${path:8:$len}
		pull="${path:8:$len}"
		#echo pull this $pull
		echo ------------------------------------------
		execute "adb pull $pull"
		ren="$(rename $1)"
		echo $ren ---------------------------------------
		if [[ -n $ren ]]; then
			log "unable to fetch - $1"
		else
			log "apk fetched - $1"
		fi
		#execute $pull
		#mv ./base.apk
		#cmd="adb shell pm path $1"
		#cmd="tree"
		#echo evaling $cmd
		#execute $cmd
	fi
	
}
pull_apk $test