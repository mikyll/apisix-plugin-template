#!/bin/bash

rm ${APISIX_SOURCE_DIR}/logs/worker_events.sock

# Start ETCD
mkdir -p ${APISIX_SOURCE_DIR}/logs
nohup etcd >${APISIX_SOURCE_DIR}/logs/etcd.log 2>&1 &

# Wait for ETCD to be healthy
until etcdctl endpoint health; do sleep 1; done

# Start APISIX
apisix start

# Link APISIX logs to
ln -sf /dev/stdout ${APISIX_SOURCE_DIR}/logs/access.log
ln -sf /dev/stderr ${APISIX_SOURCE_DIR}/logs/error.log

exec "$@"
