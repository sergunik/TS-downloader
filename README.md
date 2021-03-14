# TS-downloader
Bash script for download ts-parts and combine into one mp4 file

## Requrements
- curl
- ffmpeg

## Usage
```sh
bash downloader.sh  -n "My video" -u "https://akamai.net/8ede18.m3u8/iterator-v1.ts" -t 9
```

## Options
```
-h 	show brief help
-n 	name of result file
-u 	url for download with "iterator" placeholder
-t 	time of video in minutes
```