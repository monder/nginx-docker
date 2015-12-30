#!/bin/sh
sed -i -e "s|_CONFIG_URL_|$CONFIG_URL|g" /etc/confd/conf.d/nginx.toml
until /usr/bin/confd -onetime -node $ETCD_IP; do
    echo "[nginx] waiting for confd to create initial nginx configuration."
    sleep 5
done

echo "[nginx] confd is now monitoring etcd for changes..."
/usr/bin/confd -watch=true -node $ETCD_IP
