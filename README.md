# jenkins
Jenkins_configuration

## Quickstart
---

### Start Jenkins

## MAIN CONFIGURATION
---

## DOCKER BUILD ##

docker build . -t jenkins

## DOCKER RUN COMMAND ##

docker run -d --name jenkins -it -p 8099:8080 -v $PWD/jenkins_home:/var/jenkins_home -v /var/run/docker.sock:/var/run/docker.sock jenkins 
