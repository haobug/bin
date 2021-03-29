#!/bin/bash
adb wait-for-device
adb shell input text $@
