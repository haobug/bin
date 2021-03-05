#!/bin/bash
apk="${1:-chrome.apk}"
fname=$(fname $(basename "$apk"))
tmp_file=/tmp/aapt.package.$fname.txt
aapt.dump.badging.sh "$apk" |grep "package: name" |tee $tmp_file >&2
name=$(cat "$tmp_file"|awk '{print $2}'|cut -d'=' -f2|tr -d "'")
echo $name
rm $tmp_file
