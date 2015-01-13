USER := mtscout6
images = jenkins-master

all: data npmcache slave slave-nodejs server

data:
	@cd jenkins-data && docker build -t $(USER)/jenkins-data .

npmcache:
	@cd jenkins-npm-cache && docker build -t $(USER)/jenkins-npm-cache .

slave:
	@cd jenkins-slave && docker build -t $(USER)/jenkins-slave .

slave-nodejs: slave
	@cd jenkins-slave-nodejs && docker build -t $(USER)/jenkins-slave-nodejs .

server:
	@cd jenkins-server && docker build -t $(USER)/jenkins-server .

startdata:
	docker run --name jenkins-data $(USER)/jenkins-data echo Data-only container for Jenkins

startnpmcache:
	docker run --name jenkins-npm-cache --volumes-from docker-sock $(USER)/jenkins-npm-cache echo Data-only container for Jenkins

startserver:
	docker run -d -p 50000:50000 -p 3010:8080 --name jenkins-server --volumes-from jenkins-data --volumes-from docker-certs $(USER)/jenkins-server

# Assumes boot2docker
startsock:
	docker run -v /var/run/docker.sock:/var/run/docker.sock -v /usr/local/bin/docker:/usr/local/bin/docker --name docker-sock busybox

startcert:
	docker run --name docker-certs -v /home/docker/.docker:/var/jenkins_home/.docker busybox

.PHONY: all data startdata startserver slave slave-nodejs
