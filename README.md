imdock-gitlab-ci
====================================================

## What's this:

Gitlab-ci + Gitlab-Runner for Docker-compose


## How to and other docker-compose use the same network :

    #if you not have group network, you can create this, and other docker-compose use this network setting
    ~ $ docker network create --driver bridge imdockgroup


## How to register runner :
   
    ~ $ docker exec -it gitlab-runner-docker gitlab-runner register
    
    - key in {your-gitlab-host-setting}/ci
      ex : http://192.168.92.133:10080/ci or http://gitlab/ci

    - key in {your-token}

    - key in description (any)

    - key in tag (any)

    - key in executor
      ex : shell

    got to the setting/pipelines check