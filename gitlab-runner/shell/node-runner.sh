gitlab-runner register \
  --url "http://imdockgitlab_gitlab_1:80/ci" \
  --registration-token REGISTRATION_TOKEN \
  --description "node-runner-6.11.2" \
  --executor "docker" \
  --docker-image node:6.11.2