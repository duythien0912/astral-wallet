# syntax=docker/dockerfile:1
# MAINTAINER "Brian Scott <dev@bscott.mozmail.com>"

FROM alpine:3.6

# Install the dependencies
RUN apk add --no-cache \
    ca-certificates \
    unzip \
    wget \
    zip \
    zlib-dev

# Download Pocketbase and install it for AMD64
RUN mkdir /app

COPY ./pocketbase_alpine /app
COPY ./pb_data/. /app/pb_data

RUN chmod +x /app/pocketbase_alpine

RUN ls /app

# Notify Docker that the container wants to expose a port.
EXPOSE 8090

# Start Pocketbase
CMD /app/pocketbase_alpine serve --http="0.0.0.0:8090"
