# Other


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


## How to check gitlab nginx setting
```bash
# RESTART(直接 docker-compose down && docker-compose up) 
$ docker exec gitlab gitlab-ctl reconfigure

# CHECK NGINX CONFIG
$ docker exec gitlab cat /var/opt/gitlab/nginx/conf/gitlab-registry.conf

# 手動更新證書
$ sudo gitlab-ctl renew-le-certs
```


## How to reconfigure

RESTART(直接 docker-compose down && docker-compose up) 
```bash
$ docker exec gitlab gitlab-ctl reconfigure

```




## GitLab Deploy Token
在 GitLab 10.8 中引入

> 部署令牌是一種特殊情況. 如果用戶創建了一個名為gitlab-deploy-token的名稱，則 Deploy Token 的用戶名和令牌將自動作為環境變量暴露給 CI / CD 作業： CI_DEPLOY_USER和CI_DEPLOY_PASSWORD .
創建令牌後，可以使用以下變量登錄到 Container Registry：
docker login -u $CI_DEPLOY_USER -p $CI_DEPLOY_PASSWORD $CI_REGISTRY
注意：目前尚未為組部署令牌實現gitlab-deploy-token部署令牌的特殊處理. 為了使部署令牌可用於 CI / CD 作業，`必須在項目級別創建它`

