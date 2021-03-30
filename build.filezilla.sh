#!/bin/bash
pkg=${1:-filezilla}
#sudo apt-get build-dep -y $pkg
pushd filezilla-3.15.0.2/
autoreconf --force --install
popd
mkdir -p compile
pushd compile
../filezilla-3.15.0.2/configure --prefix=$HOME/myroot > build.configure.log 2>&1 || vim build.configure.log
make -j `nproc` > build.make.log 2>&1 || vim build.make.log
make install > build.install.log 2>&1  || vim build.install.log
popd
