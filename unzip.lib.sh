find . -name "*.apk" |while read apk;
do
    apk_dir="`dirname "$apk"`"
    unzip -o -d "$apk_dir" "$apk" 'lib/*'
    mkdir -p lib/{arm64,arm}
    rsync -Plr --remove-source-files --delete lib/{arm64-v8a/,arm64/}
    rsync -Plr --remove-source-files --delete lib/{armeabi-v7a/,arm/}
    rsync -Plr --remove-source-files --delete lib/{armeabi/,arm/}
    [ -d lib ] && \
    rm -rf lib/arm64-v8a
    rm -rf lib/armeabi-v7a
    rm -rf lib/armeabi
    rm -rf lib/arm64/arm64-v8a
    rm -rf lib/arm/armeabi-v7a
done
