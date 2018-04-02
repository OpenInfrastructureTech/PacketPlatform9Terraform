# install docker for use by monitoring software
sudo apt-get update
sudo apt-get install     apt-transport-https     ca-certificates     curl     software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository    "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt-get update
sudo apt-get install docker-ce
sudo apt-get -y install docker-ce


# startup monitor data extractor watching the underlying hardware on private interface to limit unauthorized access
PRIVATE_IP=`ip -4 address show label bond0:0  | grep inet | awk '{print $2}' | cut -d/ -f1`
docker run -d -p $PRIVATE_IP:9100:9100 --restart unless-stopped \
-v "/proc:/host/proc" \
-v "/sys:/host/sys" \
-v "/:/rootfs" \
--name=prometheus \
quay.io/prometheus/node-exporter:v0.13.0 \
  -collector.procfs /host/proc \
  -collector.sysfs /host/sys \
  -collector.filesystem.ignored-mount-points "^/(sys|proc|dev|host|etc)($|/)"
