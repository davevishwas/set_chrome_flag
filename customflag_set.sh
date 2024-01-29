#!/bin/bash

echo "------------------------------------------------------------------
 Script by Vishwas Dave
------------------------------------------------------------------
"

USAGE1="Usage: ./customflag.sh <filename>"
USAGE2="Use -h for help"
help_text="Tool for resolved chrome certificate error in Android"
file=$1
RED="\033[1;31m"
GREEN="\033[0;32m" 
RESET="\033[0m"

if [ $# == 0 ] ; then
    echo $USAGE1
    echo $USAGE2
    exit 1;
fi

if [ $1 == '-h' ] ; then
    echo $help_text
    exit 1;
fi

if [ $# == 1 ] ; then 
	if [ -f "$file" ] ; then
		echo -e "${GREEN} Copying $file... ${RESET}"
		adb push $file /data/local/chrome-command-line >&-
		adb push $file /data/local/android-webview-command-line >&-
		adb push $file /data/local/webview-command-line >&-
		adb push $file /data/local/content-shell-command-line >&-
		adb push $file /data/local/tmp/chrome-command-line >&-
		adb push $file /data/local/tmp/android-webview-command-line >&-
		adb push $file /data/local/tmp/webview-command-line >&-
		adb push $file /data/local/tmp/content-shell-command-line >&-
	
		echo -e "${GREEN} Process done.... ${RESET}"
	else
		echo -e "${RED} File not found! ${RESET}"
	fi
    
else
	echo $USAGE1
	echo $USAGE2   
	exit 1;
fi


	
	

