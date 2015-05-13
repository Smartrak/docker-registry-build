docker build -t custom-registry .
docker run -p 5000:5000 -d --name=registry custom-registry
