FROM python:3.6-alpine

LABEL maintainer "https://github.com/ryanmaclean"

ENV ENDPOINT="192.168.99.100:9200"
ENV CREDENTIALS=""
ENV CLUSTERHEALTH=""
ENV PIPELINE="--pipeline=benchmark-only"
ENV RALLYCONFIG="rally.ini"
ENV RALLYVER="0.5.3"
ENV HTTPPROXY=""
ENV REPORTFMT="markdown"

RUN apk add --update --no-cache git build-base linux-headers python-dev openjdk8
RUN pip install esrally==0.5.3

COPY config/rally.ini /root/.rally/

CMD esrally $PIPELINE --target-hosts=$ENDPOINT $CREDENTIALS $CLUSTERHEALTH
