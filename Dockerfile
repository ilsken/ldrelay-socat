FROM launchdarkly/ld-relay:v6
USER 0
RUN apk add --no-cache \
    socat \
 && rm -rf /var/cache/apk/*
COPY s6-overlay-amd64.tar.gz /tmp/s6-overlay-amd64.tar.gz 
RUN tar xzf /tmp/s6-overlay-amd64.tar.gz -C / && rm /tmp/s6-overlay-amd64.tar.gz && mkdir -p /etc/services.d /etc/services.d/ldrelay /etc/services.d/socatproxy
COPY ld-relay.sh /etc/services.d/ldrelay/run
COPY socat-proxy.sh /etc/services.d/socatproxy/run
RUN chmod +x /etc/services.d/ldrelay/run /etc/services.d/socatproxy/run
ENV REDIS_HOST=localhost
ENV REDIS_PORT=6379
ENV SOCAT_DEFAULT_LISTEN_IP=127.0.0.1
ENV SOCAT_LISTEN=TCP-LISTEN:6379,fork,reuseaddr
ENV SOCAT_UPSTREAM=openssl:my-remote-redis:6379,commonname=my-remote-redis
ENV S6_KEEP_ENV 1
ENTRYPOINT [ "/init" ]