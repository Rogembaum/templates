# https://docs.gitlab.com/ee/user/packages/container_registry/authenticate_with_container_registry.html

TOKEN=<token>
echo "$TOKEN" | docker login registry.example.com -u <username> --password-stdin





kubectl create secret docker-registry secret \
  --docker-server=registry.gitlab.com `
  --docker-username=image_pull_token `
  --docker-password=<deploy_token_password> 
  --docker-email=<email>
