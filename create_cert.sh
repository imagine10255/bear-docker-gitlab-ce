#!/bin/bash

# Linux bin paths
DOCKER="$(which docker)"

# RUNNER REG SETTING
DOMAIN="gitlab.example.com"
EMAIL="imagine@example.com"
MOUNT_PATH="/mnt/volume_sgp1_01/gitlab/config/ssl/letsencrypt"

#${DOCKER} run --rm \
#  -v ${MOUNT_PATH}:/etc/letsencrypt \
#  -it certbot/certbot certonly --manual --email ${EMAIL} --agree-tos

${DOCKER} run --rm \
  -v ${MOUNT_PATH}:/etc/letsencrypt \
  -v ./html:/html \
  -ti certbot/certbot certonly --email ${EMAIL} --agree-tos --webroot -w /html -d ${DOMAIN}
