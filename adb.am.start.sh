#!/bin/bash
apk_file=$1
act=`aapt dump badging $apk_file |grep launchable-activity|awk -F"[:'=]" '{print $4}'`
pkg=`aapt dump badging $apk_file |grep package|awk -F"[:'=]" '{print $4}'`
adb shell am start $pkg/$act
