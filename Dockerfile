FROM debian:stretch-slim

RUN apt-get update \
	&& apt-get install --no-install-recommends --no-install-suggests -y \
						nginx-full

# forward request and error logs to docker log collector
RUN ln -sf /dev/stdout /var/log/nginx/access.log \
	&& ln -sf /dev/stderr /var/log/nginx/error.log

EXPOSE 80

STOPSIGNAL SIGTERM

CMD ["nginx", "-g", "daemon off;"]
