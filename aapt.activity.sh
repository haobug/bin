. ~/.bashrc.d/android.bash

apk=${1:-"nongli-2.2.9.apk"}
aapt dump badging "$apk" | \
    grep "activity:" |tr ' ' '\n'|tee aapt.activity.txt| \
    grep "name="|cut -d'=' -f2|tr -d "['\"]"
