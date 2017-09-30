gitlab-runner register \
  --url "http://192.168.92.249:10080/ci" \
  --registration-token REGISTRATION_TOKEN \
  --description "node-runner-6.11.2" \
  --executor "docker" \
  --docker-image node:6.11.2