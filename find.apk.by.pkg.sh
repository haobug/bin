pkg=${1:-com.google.chrome}
apkdir=${2:-.}
tmp_file=/tmp/$pkg.list.$RANDOM
tmp_file=$pkg.list
echo ""> $tmp_file
find "$apkdir" -name "*.apk"|while read apk;
do
    if aapt.package.sh "$apk"|grep $pkg>/dev/null; 
    then
        echo -e "${apk}\t${pkg} FOUND"|tee -a $tmp_file
    fi
done
cat $tmp_file|sort -V|nl>&2
rm $tmp_file
