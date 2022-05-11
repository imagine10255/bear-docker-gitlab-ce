#!/bin/bash

# Linux bin paths
DOCKER="$(which docker)"
EXEC="exec -it gitlab-runner"

# RUNNER REG SETTING
GITLAB_URL="http://github.bearests.com"
RUNNER_NAME="bear-react-carousel-v3/runner1"
REGISTRATION_TOKEN="GR1348941oBQz577PRKsstQzhBtLv"



${DOCKER} ${EXEC} gitlab-runner register \
  --url "${GITLAB_URL}" \
  --registration-token "${REGISTRATION_TOKEN}" \
  --description "${RUNNER_NAME}" \
  --executor "docker" \
  --docker-image "docker:latest" \
  --docker-privileged \
  --non-interactive
