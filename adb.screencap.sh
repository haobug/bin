now()
{
date +"%Y%m%d%H%M%S"
}
ts=`now`
sid=${1:-d1b990f3}
adb -s $sid shell screencap -p /sdcard/$ts.png < /dev/null
adb -s $sid pull /sdcard/$ts.png
xdg-open $ts.png||eog $ts.png
