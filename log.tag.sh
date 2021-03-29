#!/bin/bash
tag=${1:-KeyguardViewBase}
adb shell setprop log.tag.$tag VERBOSE 
adb shell getprop log.tag.$tag
