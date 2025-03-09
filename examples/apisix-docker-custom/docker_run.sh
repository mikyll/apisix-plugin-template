#!/bin/bash

docker run --rm -it -p 9080:9080 -p 9180:9180 -p 9443:9443 \
  apache/apisix:custom
