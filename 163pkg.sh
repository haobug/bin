

fileRelativePath()
{
	pkg=$1 && \
	apt-cache show $pkg |grep Filename:|cut -d':' -f2|tr -d ' '
}


wgetOne()
{
	url=$1 && \
	output=${2} && \
	outdir=$(dirname $output) && \
	mkdir -p $outdir && \
	cd $outdir && \
	wget -N -c $url > /dev/null 2>${output}.log && rm ${output}.log
}

wget3()
{
	url=${2}
	cmd=$1
	localCache=$3
$cmd $base1/$filerelpath $localCache || \
$cmd $base2/$filerelpath $localCache  || \
$cmd $baseN/$filerelpath $localCache 

}

downloadOne()
{
	filerelpath=${1} && \
	cmd=wgetOne &&
	localCache=$cachebase/$filerelpath && \
	wget3 $cmd $filerelpath $localCache && \
	echo "sudo dpkg -i "$localCache
}


downloadDepnds()
{
	pkg=$1
	apt-cache depends $pkg|grep Depends:|cut -d':' -f2|while read pkgdep;
	do
		downloadOne $(fileRelativePath $pkgdep);
	done
}


cachebase=~/test/deb/$(lsb_release -sc)/  && \
mkdir -p $cachebase && \
pkg=${1:-polipo} && \

sudo cp -v $cachebase/*pkgcache*.bin /var/cache/apt/

filerelpath=$(fileRelativePath $pkg) && \

base1=http://mirrors.163.com/ubuntu/  && \
base2=http://mirrors.ustc.edu.cn/ubuntu/ && \
base3=$(cat /etc/apt/sources.list|grep -w ^deb|tail -n1|awk '{print $2}') && \
baseN=http://archive.ubuntu.com/ubuntu && \

echo "=====Main=====" && \
downloadOne $filerelpath && \
echo "=====Main=====" && \
downloadDepnds $pkg
