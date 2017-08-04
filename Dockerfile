FROM debian:stretch-slim

MAINTAINER NGINX Docker Maintainers "docker-maint@nginx.com"

ENV NGINX_VERSION 1.13.3-1~stretch
ENV NJS_VERSION   1.13.3.0.1.11-1~stretch

RUN apt-get update \
	&& apt-get install --no-install-recommends --no-install-suggests -y \
						nginx-full

# forward request and error logs to docker log collector
RUN ln -sf /dev/stdout /var/log/nginx/access.log \
	&& ln -sf /dev/stderr /var/log/nginx/error.log

EXPOSE 80

STOPSIGNAL SIGTERM

CMD ["nginx", "-g", "daemon off;"]
