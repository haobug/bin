##### Compile-time
#
#- Qt >= 5.9
#  + Development tools
#- GCC >= 7.4
#- CMake >= 3.13

sudo apt-get -f install
sudo apt-get  install -y g++ cmake build-essential qt5-default qttools5-dev-tools libqt5svg5-dev qttools5-dev
wget -c https://cmake.org/files/v3.13/cmake-3.13.5-Linux-x86_64.tar.gz
tar xf cmake-3.13.5-Linux-x86_64.tar.gz
pushd cmake-3.13.5-Linux-x86_64
export PATH=$PWD/bin:$PATH
popd
wget --no-proxy -c http://mirrors.ustc.edu.cn/qtproject/archive/qt/5.9/5.9.9/qt-opensource-linux-x64-5.9.9.run
chmod +x qt-opensource-linux-x64-5.9.9.run
[ -d ~/Qt5.9.9 ] || ./qt-opensource-linux-x64-5.9.9.run
export QT_DIR=~/Qt5.9.9/5.9.9/gcc_64
export PATH=$QT_DIR/bin:$PATH
export LD_LIBRARY_PATH=$QT_DIR/lib:$LD_LIBRARY_PATH
mkdir build
pushd build

#cmake -DCMAKE_PREFIX_PATH=/usr/include/x86_64-linux-gnu/qt5/ ../flameshot-0.8.5/
cmake -DCMAKE_PREFIX_PATH=$QT_DIR ../flameshot-0.8.5/
make -j `nproc`
#make -j1
#

##### Run-time
#
#- Qt
#  + SVG
