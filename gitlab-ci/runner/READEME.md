# Gitlab CI/CD


## How to register runner :

1. before you need up runner

```bash
~/imdock-gitlab-ci/runner $ docker-compose up -d
```

2. then register runner

2.1. use sample sh script

```bash
$ docker exec -it gitlab-runner-docker sh ./smaple-runner.sh
````

2.2. use manual command

```bash
$ docker exec -it gitlab-runner-docker gitlab-runner register
```
- key in {your-gitlab-host-setting}/ci
  > ex : https://gitlab.example.com:8443/
- key in {your-token}
- key in description (any)
- key in tag (any)
- key in executor
  > ex : shell


3. got to the setting/pipelines check
