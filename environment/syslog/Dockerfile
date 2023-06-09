FROM alpine:3.4

RUN apk add --update syslog-ng
COPY config/. /etc/syslog-ng/

ENTRYPOINT ["/usr/sbin/syslog-ng", "-F"]
