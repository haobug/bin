hport=${1:-12345}
name=portainer
cmd="docker run -d -p ${hport}:8000 -p 9000:9000 --name=${name} --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer-ce"
run_exist()
{
	cid=`docker container list -a |grep ${name}|awk '{print $1}'`
	docker container start $cid
}
set -x
$cmd || \
	run_exist
sudo ufw allow $hport
set +x
