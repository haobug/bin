export PATH=${HOME}/bin/aapt_tools:$PATH
echo `aapt.package.sh "$1"`/`aapt.activity.sh "$1"
