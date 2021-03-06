lib_dir=${1:-lib}
find ${lib_dir} -name "*.so" |while read so_path;
do
    echo `basename "${so_path}"`
done|sort -V |uniq \
    | while read so_base;
    do
        echo "    lib/\$(TARGET_ARCH)/$so_base \\"
    done

echo 'LOCAL_PREBUILT_JNI_LIBS += \'
