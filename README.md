bear-docker-gitlab-ce
====================================================

## What's this:

Gitlab-ce + Gitlab-Runner for docker-compose


## How to and other docker-compose use the same network :

```bash
#if you not have group network, you can create this, and other docker-compose use this network setting
~ $ docker network create --driver bridge service_group
```

## How to start:

```bash
~/ $ git clone https://github.com/imagine10255/bear-docker-gitlab-ce gitlab
~/ $ cd gitlab
~/gitlab $ vi docker-compose.yml

```
Change your domain in `./docker-compose.yml`


Create your ssl cert (not use cloudflare proxy ssl)
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

## How reset admin password

```bash
$ docker ps
$ docker exec -it gitlab bash <= that is my container name in step 1
$ gitlab-rails console -e production <= wait, minutes for another prompt to come
$ user = User.where(id: 1).first
$ user.password = 'secret_pass' <= use your favorite password
$ user.password_confirmation = 'secret_pass' <= again
$ user.save! <= save user
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