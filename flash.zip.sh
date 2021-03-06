zipfile="$1"
dname=$(fname $zipfile)
until unzip -o -d "$dname"  $zipfile; do echo retrying... && sleep 1; done;
pushd $dname
flash.this.sh
popd
