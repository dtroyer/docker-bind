#!/bin/sh -x

# If an alternate config is present, copy it into place and use it
if [ -r /etc/bind.alt/entrypoint.sh ]; then
    source /etc/bind.alt/entrypoint.sh
fi

OPTIONS=$@
# Run in foreground and log to STDERR (console):
exec /usr/sbin/named -c /etc/bind/named.conf -g -u named $OPTIONS
