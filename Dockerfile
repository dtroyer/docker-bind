# BIND9

FROM alpine:latest
LABEL maintainer="dtroyer"

RUN apk --update upgrade && apk add bind bind-tools bind-plugins

VOLUME ["/etc/bind"]

# Get latest bind.keys
RUN    wget -q -O /etc/bind/bind.keys https://ftp.isc.org/isc/bind9/keys/9.11/bind.keys.v9_11 ; \
    rndc-confgen -a

#COPY configs/. /etc/bind/

EXPOSE 53 53/udp

COPY entrypoint.sh /
ENTRYPOINT ["/entrypoint.sh"]

#CMD ["/usr/sbin/named", "-c", "/etc/bind/named.conf", "-g", "-u", "named"]
