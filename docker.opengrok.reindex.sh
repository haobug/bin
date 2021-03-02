cid=$1
if [ -z $cid ];
then
    sudo docker container ls |tee cid.list|nl
    read -p "which cid: " num
    cid=`cat cid.list |head -n${num}|tail -n1|awk '{print $1}'`
fi
docker.shell.sh $cid /scripts/index.sh
