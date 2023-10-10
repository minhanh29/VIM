# Vim Files
Author: *Minh Anh Nguyen*
My Vim's important files
## Repositories
docker pull bcr-de01.inside.bosch.cloud/stk2ban/backendapi
docker pull bcr-de01.inside.bosch.cloud/stk2ban/llm
docker pull bcr-de01.inside.bosch.cloud/stk2ban/mongodb
docker pull bcr-de01.inside.bosch.cloud/stk2ban/elasticsearch

access key
Stk2ban
74da1a0b-625f-46ac-9151-57d3d7f6de3c

# Push to repo
start cntml
docker login bcr-de01.inside.bosch.cloud --username Stk2ban --password 74da1a0b-625f-46ac-9151-57d3d7f6de3c
docker tag IMAGE_ID REPO_URL
docker push REPO_URL
