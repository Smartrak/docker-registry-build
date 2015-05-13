docker stop custom-registry
docker rm custom-registry
docker run -d --name=registry custom-registry
