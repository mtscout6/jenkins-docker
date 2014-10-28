#! /bin/bash

keytool -no-prompt -import -keystore /usr/lib/jvm/java-7-openjdk-amd64/jre/lib/security/cacerts -alias docker-ca -file /var/jenkins_home/.docker/ca.pem -storepass changeit
keytool -no-prompt -import -keystore /usr/lib/jvm/java-7-openjdk-amd64/jre/lib/security/cacerts -alias docker-cert -file /var/jenkins_home/.docker/cert.pem -storepass changeit
keytool -no-prompt -import -keystore /usr/lib/jvm/java-7-openjdk-amd64/jre/lib/security/cacerts -alias docker-key -file /var/jenkins_home/.docker/key.pem -storepass changeit
