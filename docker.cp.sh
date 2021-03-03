#!/bin/bash
src=${1:-nginx.conf}
dst=${2:-/etc/nginx/nginx.conf}
cid=${3:-some-nginx}
docker cp ${src} ${cid}:$dst
docker container stop $cid
docker container start $cid
