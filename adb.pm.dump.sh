#!/bin/bash
pkg=${1:-com.android.systemui}
adb wait-for-device 
if adb.pm.path.sh $pkg;
then
    adb shell pm dump ${pkg} < /dev/null |tee adb.pm.dump.${pkg}.log
else
    exit 1
fi
