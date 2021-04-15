# LD Relay + Redis Socat Proxy

Allows connecting to a Redis instance via socat 

Example: Connecting to a Redis via TLS with an overriden common name (fix for mismatched hostname):

```
# LD Relay will connect via localhost 
# We want to fork in order to survive disconnects
ENV SOCAT_LISTEN=TCP-LISTEN:6379,fork,reuseaddr
# Connect to my-remote-redis over TLS but use some-other-name for hostname verification
ENV SOCAT_UPSTREAM=openssl:my-remote-redis:6379,commonname=some-other-name
```

