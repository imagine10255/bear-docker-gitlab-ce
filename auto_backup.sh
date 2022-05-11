#!/bin/bash
docker exec -i gitlab gitlab-rake gitlab:backup:create
