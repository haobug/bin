#!/bin/bash
tmp_file=/tmp/screenls.log
screen -ls|head -n-2|tail -n+2|nl|tee $tmp_file
read -p "num: " line
str=`cat $tmp_file|head -n $line|tail -n1`
screen_id=`echo $str|awk '{print $2}'`
screen -r $screen_id || screen -x $screen_id
