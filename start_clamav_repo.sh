#!/bin/bash

set -eu pipefail

SERVER_IP=$(ip route get 1.1.1.1 | grep -oP 'src \K\S+')

docker run --rm -d -p 7080:80 --name clamav -v /var/lib/clamav/:/usr/share/nginx/html nginx 1> /dev/null

cat << EOF
========================================================================

Nginx is serving clamav update files.
Configure your /etc/freshclam.conf to get udpates from this server
PrivateMirror http://$SERVER_IP:7080

# ScriptedUpdates is not needed because you won't be serving CDIFF files.
ScriptedUpdates no

========================================================================
EOF
