srcdir=${1:-/disk2/opengrok/src}
port=${2:-8082}
docker run -d -e REINDEX=0 -v ${srcdir}:/opengrok/src -p ${port}:8080 opengrok/docker:1.5
