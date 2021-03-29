#!/bin/bash
pkg=${1:-com.android.settings}
        lines=$(adb shell pm path $pkg </dev/null|tee adb.pm.path.$pkg.log|grep 'package:'|wc -l)
        if [ $lines -gt 0 ];
        then
            echo "$pkg FOUND: `cat adb.pm.path.$pkg.log|cut -d':' -f2-|tee adb.pm.path.${pkg}.txt`">&2
            cat adb.pm.path.$pkg.txt
        else
            echo "$pkg NOT_FOUND">&2
            exit 1
        fi
