FROM python:3.6-alpine

LABEL maintainer "https://github.com/ryanmaclean"

RUN apk add --update --no-cache git build-base linux-headers python-dev openjdk8
RUN pip install esrally==0.5.3
COPY config/rally.ini /root/.rally/
ENV ENDPOINT="192.168.99.100:9200"
ENV CREDENTIALS=""
ENV CLUSTERHEALTH=""
CMD esrally --pipeline=benchmark-only --target-hosts=$ENDPOINT $CREDENTIALS $CLUSTERHEALTH
