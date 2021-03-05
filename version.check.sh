#!/bin/bash

apk="${1:-chrome.apk}"
bname=$(basename "$apk")
pkg=$(aapt.package.sh "$apk")
aapt_ver=$(aapt.versionName.sh "$apk"|tee aapt_ver.$pkg)
echo $aapt_ver
#adb.pm.dump.sh $pkg
#if [ $? -ne 0 ];
#then
#    echo -e "$apk\t$pkg NOT_FOUND on device">&2
#    exit 2
#fi
adb_ver=$(adb.versionName.sh $pkg|tee adb_ver.$pkg)
echo $adb_ver

if echo $adb_ver|grep $aapt_ver>/dev/null;
then
    echo -e "$apk\t$pkg\t$aapt_ver\tSAME"|tee version.check.${pkg}.txt
    exit 0
else
    diff -Naru aapt_ver.${pkg} adb_ver.$pkg>&2
    if [ -z $adb_ver ];
    then
        adb_ver="NOT_FOUND"
    fi
    echo -e "$apk\t$pkg\t$aapt_ver\tDIFF(device:$adb_ver)"|tee version.check.${pkg}.txt
    exit 1
fi
