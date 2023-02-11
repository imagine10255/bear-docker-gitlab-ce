bear-docker-gitlab-ce
====================================================

## What's this:

Gitlab-ce + Gitlab-Runner for docker-compose


## How to and other docker-compose use the same network :

```bash
#if you not have group network, you can create this, and other docker-compose use this network setting
~ $ docker network create --driver bridge service_group
```

## How to start gitlab :

```bash
~/ $ git clone https://github.com/imagine10255/bear-docker-gitlab-ce gitlab
~/ $ cd gitlab
~/gitlab $ vi docker-compose.yml

```
Change your domain in `./docker-compose.yml`


Create your ssl cert
```bash
# change your domain in ./create_cert.sh
$ sh create_cert.sh 
```

```bash
~/gitlab $ docker-compose up -d
```

Check root password
```bash
docker exec -it gitlab grep 'Password:' /etc/gitlab/initial_root_password
```

## How reset root password

```bash
$ docker ps
$ docker exec -it gitlab bash <= that is my container name in step 1
$ gitlab-rails console -e production <= wait, minutes for another prompt to come
$ user = User.where(id: 1).first
$ user.password = 'secret_pass' <= use your favorite password
$ user.password_confirmation = 'secret_pass' <= again
$ user.save! <= save user
```

## How to backup gitlab :

```bash
$ crontab -e

# backup gitlab
30 01 * * * /bin/sh /home/{your_username}}/gitlab/auto_backup.sh > /home/{your_username}/services/gitlab/cronlog.txt 2>&1
```

path: `/mnt/volume_sgp1_01/gitlab/data`


## How to restore

restore before, check your container is stop ($ docker-compose down)

```bash
# List available backups
~/gitlab $ docker-compose run --rm gitlab app:rake gitlab:backup:restore
```
<img src="./assets/gitlab-backup.webp"/>

Then you can start


## How to reset password by admin:

```bash
$ docker exec -it {your_gitlab_contanier_id} /bin/bash
$ su - git
$ cd gitlab
$ bundle exec rails c production
$ user = User.where(id: 1).first
$ user.password = 'NEW_PASS'
$ user.password_confirmation = 'NEW_PASS'
$ user.save
$ exit
```


## How to reset init:

How to clear all data, re init (clear volume)

```bash
~/imdock-gitlab-ci $ docker-compose down -v
```



## Ref
- [GitLab CI 上傳 Image 到 Google Container Registry](https://ithelp.ithome.com.tw/articles/10266998)
- [Update: Using Free Let’s Encrypt SSL/TLS Certificates with NGINX](https://www.nginx.com/blog/using-free-ssltls-certificates-from-lets-encrypt-with-nginx/)
- [攻略docker版Let's Encrypt憑證申請](https://www.ccc.tc/article/letsencrypt)