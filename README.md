# TS-downloader
Bash script for download ts-parts and combine into one mp4 file

## Requrements
- curl
- ffmpeg

## Usage
```sh
chmod +x downloader.sh
./downloader.sh  -n "My Immortal (Chorus)" -u "https://embedwistia-a.akamaihd.net/deliveries/d7757126938fd3d97ce361583b97c7d9788ede18.m3u8/seg-iterator-v1-a1.ts" -t 9
```

## Options
```
-h 		show brief help
-n 		specify a filename
-u 		specify an url for download with "iterator" placeholder
-t 		specify a time in minutes
```