#!/bin/bash
page=${1:-symless.com}
domain=$(echo $page |rev|cut -d'.' -f1-2|rev)
wget --domains=$domain -N -c -m --no-parent --exclude-directories=forums $page
