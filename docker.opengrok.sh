srcdir=${1:-/disk2/opengrok/src}
port=${2:-8082}
name=$(basename $srcdir|tr '[\-,;.]' '_'|tr [A-Z] [a-z])
docker run -d --name $name -e REINDEX=0 -v ${srcdir}:/opengrok/src -p ${port}:8080 opengrok/docker:1.5
