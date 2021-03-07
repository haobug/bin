#!/bin/bash
#java -classpath ./build/libs/jd-gui-1.4.0.jar org.jd.gui.App ./build/libs/jd-gui-1.4.0.jar
cwd=`dirname $0`
set -x
java -classpath $cwd/jd-gui.jar org.jd.gui.App $@
set +x
