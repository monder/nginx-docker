# nginx-docker
[![](https://imagelayers.io/badge/monder/nginx-docker:latest.svg)](https://imagelayers.io/?images=monder/nginx-docker:latest 'Get your own badge on imagelayers.io')

Docker image with nginx and confd with remote config loading support.

Example:
```
docker run \
  -d \
  -p 80:80 \
  -e ETCD_IP=10.0.1.5:2379 \
  -e CONFIG_URL=https://private-s3-address.com/nginx.conf.tmpl \
  monder/nginx-docker
```
