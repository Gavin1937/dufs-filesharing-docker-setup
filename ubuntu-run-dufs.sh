#! /bin/bash

sudo docker run \
	--rm -it --name dufs \
	-v `pwd`/data:/data \
	-p `jq -r .port config.json`:5000 \
	sigoden/dufs /data -A -a `jq -r .username config.json`:`jq -r .password config.json`@/:rw


