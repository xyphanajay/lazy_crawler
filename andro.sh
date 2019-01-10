#!/bin/bash
echo Script ON
#ifsource pull_apk.sh


app_name=''

get_name(){
	echo App Name to search on play store:
	read $app_name
}

show_name(){
	echo $app_name
}

