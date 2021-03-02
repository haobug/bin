#!/bin/bash
simg=${1:-system_test.img}
stem=$(filestem $simg) 
ext=${stem}.ext
ls $ext || simg2img $simg $ext
mkdir  -p $stem/
sudo mount -text4 $ext $stem/
rm -rf framework-res/ ; ~/bin/apktool_dir/apktool d $stem/framework/framework-res.apk
rm -rf framework ; unzip -o -d framework $stem/framework/framework.jar *.dex
find framework/*.dex |while read dex;
do
        dexstem=$(filestem $(basename $dex))
        rm -f $dexstem ; 
        ~/bin/dex2jar/d2j-dex2jar.sh $dex;
        #~/bin/dex2jar/d2j-dex2smali.sh $dex;
done
