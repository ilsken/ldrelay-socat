#!/usr/bin/execlineb -P
s6-setuidgid ldr-user
with-contenv  /usr/bin/ldr --config /ldr/ld-relay.conf --allow-missing-file --from-env