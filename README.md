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



## Ref
- [GitLab CI 上傳 Image 到 Google Container Registry](https://ithelp.ithome.com.tw/articles/10266998)
- [Update: Using Free Let’s Encrypt SSL/TLS Certificates with NGINX](https://www.nginx.com/blog/using-free-ssltls-certificates-from-lets-encrypt-with-nginx/)
- [攻略docker版Let's Encrypt憑證申請](https://www.ccc.tc/article/letsencrypt)
- [docker-gitlab 與 container registry](https://blog.elleryq.idv.tw/2017/12/docker-gitlab-container-registry.html)