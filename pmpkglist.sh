#!/bin/bash
pmpkglist()
{
    local ptn=$@
    adb shell pm list packages|cut -d':' -f2|grep $ptn
}
# main
pmpkglist $@
