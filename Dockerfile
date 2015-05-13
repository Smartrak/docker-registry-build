FROM registry:2.0

COPY config.yml /go/src/github.com/docker/distribution/cmd/registry/config.yml
RUN mkdir /registry

EXPOSE 5000
