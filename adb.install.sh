#!/bin/bash
while test $# -ge 1;
do
    adb install -r "$1" # || echo adb uninstall `aapt.package.sh $1`
    adb shell am start `aapt.act.sh "$1"`
    shift
done
