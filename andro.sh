#!/bin/bash
echo Script ON
#ifsource pull_apk.sh


read app_name
var="master"
name="whoami"
echo "_______"
get_name(){
	echo App Name to search on play store:
	read $1
}
test1(){
	eval $name
}
x="$(test1)"
#pwd
#echo i am $x
show_name(){
	echo "this was $1"
	local test='data'
	echo nmo
	echo gggg
}

#echo got this value from user ======= $app_name
show_name "$app_name"
#show_name "second"
#show_name "$var"
result="$(show_name)"
#echo this is hidden $result

device="adb devices"
dev()
{
	eval $device 
}
echo "$(dev)" >> log.txt