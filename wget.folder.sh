#!/bin/bash
. ~/.bashrc.d/wget.bash
hewget -m -np --reject "index.html*" $@
