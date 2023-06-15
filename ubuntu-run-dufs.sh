#! /bin/bash

sudo docker run \
	--rm --name dufs \
	$(jq -r '.detach | (if . == true then "-d" else "-it" end)' config.json) \
	-v `pwd`/data:/data \
	-p `jq -r .port config.json`:5000 \
	sigoden/dufs /data -A -a `jq -r .username config.json`:`jq -r .password config.json`@/:rw


