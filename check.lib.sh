lib_dir=${1:-lib}
find ${lib_dir} -name "*.so" |while read so_path;
do
    echo `basename "${so_path}"`
done|sort -V |uniq \
    | while read so_base;
    do
        adb wait-for-device
        tmp_file=/tmp/check.lib.adb.log
        adb shell 'find /system/lib/*  /vendor/lib/*  /system/priv-app/* /system/app/* -name '$so_base' 2>/dev/null' < /dev/null > $tmp_file 2>&1
        if         grep -rw "$so_base"  $tmp_file;
        then

            if  adb shell file `grep -w $so_base $tmp_file`</dev/null|grep '32-bit LSB arm' ;
            then
                echo -e "$so_base\tOK" 
            else
                echo -e "$so_base\tFOUND, but arch is NOT ok" 
            fi
        else
            echo -e "$so_base\tNOT_FOUND" 
        fi
    done
