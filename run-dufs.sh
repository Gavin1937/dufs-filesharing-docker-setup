#! /bin/bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

MOUNT_DIR="$SCRIPT_DIR/data"

if [ $# -ge 1 ]
then MOUNT_DIR=$(python -c "from os.path import abspath; print(abspath('$1'));")
else
  MOUNT_DIR="$SCRIPT_DIR/data"
  mkdir -p "$MOUNT_DIR"
fi

CONFIG=$(<"$SCRIPT_DIR/config.json")
DETACH_CONTAINER=$(jq -r '.detach | (if . == true then "-d" else "-it" end)' <<< $CONFIG)
DETACH_CONTAINER_BOOL=$(jq -r .detach <<< $CONFIG)
CONTAINER_PORT=$(jq -r .port <<< $CONFIG)
CONTAINER_UNAME=$(jq -r .username <<< $CONFIG)
CONTAINER_PWORD=$(jq -r .password <<< $CONFIG)


echo "DETACH_CONTAINER: $DETACH_CONTAINER_BOOL"
echo "CONTAINER_PORT: $CONTAINER_PORT"
echo "CONTAINER_UNAME: $CONTAINER_UNAME"
echo "CONTAINER_PWORD: $CONTAINER_PWORD"


docker run \
	--rm --name dufs \
	$DETACH_CONTAINER \
	-v "$MOUNT_DIR:/data" \
	-p $CONTAINER_PORT:5000 \
	sigoden/dufs /data -A -a "$CONTAINER_UNAME:$CONTAINER_PWORD@/:rw"

