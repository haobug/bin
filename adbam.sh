#!/bin/bash
set -x
ptn=.
if [ -n $1 ];
then
    ptn=$1
fi
pmpkglist $ptn|nl
echo -n "which package:"
read num
pkgname=`pmpkglist $ptn|head -n ${num} |tail -n1|tr -d '\r'`;
act=$pkgname
adb shell am start $act
