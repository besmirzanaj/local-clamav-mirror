# local-clamav-mirror

Used instructions from here: https://docs.clamav.net/appendix/CvdPrivateMirror.html?highlight=proxy#use-an-http-proxy

Tested on a rocky linux 9 VM with docker

## Install dependencies

```shell
dnf install -y clamav-update
systemctl enable --now clamav-freshclam
```

Validate the service has no eerors with

```shell
# systemctl status clamav-freshclam --legend=no 
● clamav-freshclam.service - ClamAV virus database updater
     Loaded: loaded (/usr/lib/systemd/system/clamav-freshclam.service; enabled; preset: disabled)
     Active: active (running) since Tue 2024-03-12 13:19:23 EDT; 23min ago
```

## Run the script

```shell
# ./start_clamav_repo.sh 
========================================================================

Nginx is serving clamav update files.
Configure your /etc/freshclam.conf to get udpates from this server
PrivateMirror http://192.168.88.195:7080

# ScriptedUpdates is not needed because we won't be serving CDIFF files.
ScriptedUpdates no

========================================================================
```

and that is it
