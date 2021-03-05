hport=${1:-8080}
run_exist()
{
	cid=`docker container list -a |grep my-jenkins-1|awk '{print $1}'`
	docker container start $cid
}
set -x
docker run --name my-jenkins-1 -p $hport:8080 -p 50000:50000 -v /disk2/jenkins_home:/var/jenkins_home jenkins/jenkins:lts || \
	run_exist
sudo ufw allow $hport
set +x
ip=`hostname -I |awk '{print $1}'`
echo http://$ip:$hport
