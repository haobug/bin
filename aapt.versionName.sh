#!/bin/bash
apk="${1:-chrome.apk}"
fname=$(fname $(basename "$apk"))
tmp_file=/tmp/aapt.versionName.$fname.txt
aapt.dump.badging.sh "$apk" |grep versionName|tee $tmp_file>&2
versionName=$(cat "$tmp_file"|awk '{print $4}'|cut -d'=' -f2|tr -d "'")
echo $versionName
rm $tmp_file
