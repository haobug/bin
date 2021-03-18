#!/bin/bash
now()
{
date +"%Y%m%d%H%M%S"
}

pullback()
{
adb shell content insert --uri content://settings/system --bind name:s:show_touches --bind value:i:0 < /dev/null
adb pull /sdcard/$outfile
xdg-open $outfile || mplayer $outfile
exit 0
}

trap 'echo interrupt' INT

ts=`now`
outfile=$ts.mp4
adb shell content insert --uri content://settings/system --bind name:s:show_touches --bind value:i:1 < /dev/null
adb shell screenrecord $@ /sdcard/$outfile < /dev/null
pullback
