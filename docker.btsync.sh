#!/bin/bash
WEBUI_PORT=8888
DATA_FOLDER=/
OTHER_DIR=/home/qinghao
DIR_NAME=qinghao
docker run -d \
    --user=$USER \
    --group-add $USER \
    --name BTSync \
    -p 127.0.0.1:$WEBUI_PORT:8888 \
    -p 55555 \
    -v $DATA_FOLDER:/mnt/sync \
    -v $OTHER_DIR:/mnt/mounted_folders/$DIR_NAME \
    --restart on-failure \
    resilio/sync
