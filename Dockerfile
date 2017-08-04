FROM debian:stretch-slim

RUN apt-get update && apt-get install --no-install-recommends --no-install-suggests -y \
                                                nginx \
                                                libpam-ldapd \
                                                supervisor \
    && rm -rf /var/lib/apt/lists/*

COPY config/ /
RUN chmod +x init.sh

EXPOSE 443

CMD ["./init.sh"]
