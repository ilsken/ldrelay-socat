#!/usr/bin/with-contenv sh

exec socat TCP-LISTEN:$REDIS_PORT $SOCAT_UPSTREAM