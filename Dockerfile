FROM ubuntu:14.04
MAINTAINER IANA (iatenewtonsapple@github)

# docker build -t iatenewtonsapple/infinite-quiz-dashboard .

# interactive:
# docker run -i -t -p 5000:80 --name infinite-quiz-dashboard-live iatenewtonsapple/infinite-quiz-dashboard

# docker run -d -p 5000:80 --name infinite-quiz-dashboard-live iatenewtonsapple/infinite-quiz-dashboard

ENV DEBIAN_FRONTEND noninteractive

# Apt packages
COPY ./apt/packages.txt /usr/local/packages.txt
RUN apt-get update && cat /usr/local/packages.txt | xargs apt-get install -yq

# forward request and error logs to docker log collector
RUN ln -sf /dev/stdout /var/log/nginx/access.log \
	&& ln -sf /dev/stderr /var/log/nginx/error.log

RUN rm -rf /usr/share/nginx/html
RUN git clone https://github.com/iatenewtonsapple/infinite-quiz-dashboard.git /usr/share/nginx/html

EXPOSE 80 443

CMD ["nginx", "-g", "daemon off;"]