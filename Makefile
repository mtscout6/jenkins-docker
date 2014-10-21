USER := mtscout6
images = jenkins-master

all: data

data:
	@cd jenkins-data && docker build -t $(USER)/jenkins-data .

npmcache:
	@cd jenkins-npm-cache && docker build -t $(USER)/jenkins-npm-cache .

slave:
	@cd jenkins-slave && docker build -t $(USER)/jenkins-slave .

slave-nodejs:
	@cd jenkins-slave-nodejs && docker build -t $(USER)/jenkins-slave-nodejs .

server:
	@cd jenkins-server && docker build -t $(USER)/jenkins-server .

startdata:
	docker run -d --name jenkins-data $(USER)/jenkins-data echo Data-only container for Jenkins

startnpmcache:
	docker run -d --name jenkins-npm-cache --volumes-from docker-sock $(USER)/jenkins-npm-cache echo Data-only container for Jenkins

startserver:
	docker run -d -p 50000:50000 -p 3010:8080 --name jenkins-server --volumes-from jenkins-data $(USER)/jenkins-server

# Assumes boot2docker
startsock:
	docker run -v /var/run/docker.sock:/var/run/docker.sock -v /usr/local/bin/docker:/usr/local/bin/docker --name docker-sock busybox

.PHONY: all data startdata statserver slave slave-nodejs
