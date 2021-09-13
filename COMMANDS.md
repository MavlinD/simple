```bash
test connection to mongodb^
nc -zv mongodb 27017

mongo localhost:4040

/nginx: COMPOSE_DOCKER_CLI_BUILD=1 DOCKER_BUILDKIT=1 dcup

# Set buildx as the default builder
docker buildx install
# stop all running cont
docker stop $(docker ps -a -q)
# войти в контейнер web как пользователь nginx
docker exec -itu nginx web bash

```
