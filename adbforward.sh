port=$1
set -x
adb forward tcp:$port tcp:$port
