# docker-registry-build
Scripts to help making a docker registry server on a ubuntu 14.04 host

Configures a docker registry 2.0 server, puts a nginx server in front of it for (optional) ssl and user authentication.

## ref

https://github.com/docker/distribution/blob/master/docs/deploying.md
https://github.com/docker/distribution/blob/release/2.0/docs/deploying.md
https://github.com/docker/distribution/blob/release/2.0/docs/configuration.md
https://www.digitalocean.com/community/tutorials/how-to-set-up-a-private-docker-registry-on-ubuntu-14-04

## Instructions

```
wget https://github.com/Smartrak/docker-registry-build/archive/master.tar.gz
tar -zxf docker-registry-build-master.tar.gz
cd docker-registry-build-master
sudo sh ./step1.sh `whoami`
```

log out and back in (Your user is now in the docker group)

```
cd docker-registry-build-master
nano config.yml
```

Change the last line (secret)

```
sh ./step2.sh
```

Try open http://dockerregistryhost:5000/
Should get "404 page not found"

```
sh ./step3.sh
```

Now we have the registry running, we need to put nginx in front

```
cd nginx
```

Get your ssl certs and put them in nginx/ as registry.crt registry.key
Set up the htpasswd file by running:

```
htpasswd -c registry.htpasswd {username}
```
Then add more using
```
htpasswd registry.htpasswd {username}
```

Now build the registry-proxy:
```
docker build -t registry-proxy .
```

And start it linked to the registry:
```
docker run -d -p 443:443 --name registry-proxy --link registry:registryv2 registry-proxy
```
