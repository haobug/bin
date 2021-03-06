#!/bin/bash
wget_download()
{
wget -c --no-check-certificate --wait=5 --random-wait $@
}

download()
{
local url=$1
echo $url
wget_download $url
}

download_one()
{
local pkg=$1
echo "pkg=$pkg"
apt-cache  show $pkg|grep 'Filename:'|cut -d' ' -f2|while read relative;
do
if [[ `echo -n $relative|wc -c` -le 1 ]];
then
	echo "Not download url found for '$pkg'"
	echo -e "\t Here is the search result:"
	apt-cache search $pkg
	exit 9
fi
base_url=`cat /etc/apt/sources.list|grep -w deb|sed '/#/d' |head -n1|cut -d' ' -f2`
download "${base_url}${relative}"
done
}

dependencies()
{
local pkg=$1
apt-cache showpkg $pkg|grep Dependencies: -A1|tail -n1|cut -d' ' -f3-|sed 's@\() \)@\1\n@g'|sed '/^$/d'|cut -d' ' -f1|sort |uniq|sed '/^$/d'
}

pkg=$1
download_one $pkg
dependencies $pkg |while read dep; 
do 
	download_one $dep;
done;
