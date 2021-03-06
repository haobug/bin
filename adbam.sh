#!/bin/bash
ptn=${1:-android}
pmpkglist.sh $ptn|nl
echo -n "which package:"
read num
pkgname=`pmpkglist.sh $ptn|head -n ${num} |tail -n1|tr -d '\r'`;
act=$pkgname
adb shell am start $act
