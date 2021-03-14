#!/bin/bash

PACKAGE=$(basename "$0")
TS_DIR=ts/
rm -rf $TS_DIR && mkdir $TS_DIR

while getopts "hn:u:t:" arg; do
	case $arg in
		h)
			echo "$PACKAGE – Downloader TS files and combine into one mp4"
			echo " "
			echo "usage: $PACKAGE [options]"
			echo " "
			echo "options:"
			echo "-h 		show brief help"
			echo "-n 		specify a filename"
			echo '-u 		specify an url for download with "iterator" placeholder'
			echo '-t 		specify a time in minutes'
			exit 0
			;;
	    n) NAME=$OPTARG;;
	    u) URL=$OPTARG;;
	    t) TIME=$(($OPTARG*60 / 3));;
	esac
done

function ProgressBar {
	let _progress=(${1}*100/${2}*100)/100
	let _done=(${_progress}*4)/10
	let _left=40-$_done

	_done=$(printf "%${_done}s")
	_left=$(printf "%${_left}s")

	printf "\rProgress : [${_done// /#}${_left// /-}] ${_progress}%%"
}


touch "${TS_DIR}all.ts"
for (( i=1; i<=$TIME; i++ ))
do
	ProgressBar $i $TIME
	curl -s "${URL//iterator/$i}" --compressed --output "${TS_DIR}${i}.ts" > /dev/null
	cat "${TS_DIR}${i}.ts" >> "${TS_DIR}all.ts"
	rm -f "${TS_DIR}${i}.ts"
done

ffmpeg -i "${TS_DIR}all.ts" -acodec copy -vcodec copy "${NAME}.mp4" -hide_banner -loglevel error
rm -rf $TS_DIR

printf '\nFinished!\n'