#!/bin/bash
logfile=${1:-adb_logcat`now`.log}
#'main', 'system', 'radio' or 'events'
adb logcat -b all -c
adb logcat -b main -b system -b events -b all -vthreadtime|tee $logfile
