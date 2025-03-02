#!/bin/bash

ADMIN_APIKEY="1a8fe9bd-73ab-493c-ac82-44db40eab641"

# Upstreams
# Upstream to internal service (hosted on Docker, accessible via bridged virtual network at http://httpbin-standalone:80 or http://localhost:3000)
curl -s -i -X PUT "http://localhost:9180/apisix/admin/upstreams/internal_httpbin" -H "X-API-KEY: $ADMIN_APIKEY" -d '
{
  "nodes": {
    "httpbin-traditional:80": 1
  },
  "type": "roundrobin"
}'

# Upstream to external service (accessible at https://httpbin.org)
curl -s -i -X PUT "http://localhost:9180/apisix/admin/upstreams/external_httpbin" -H "X-API-KEY: $ADMIN_APIKEY" -d '
{
  "scheme": "https",
  "nodes": {
    "httpbin.org": 1
  },
  "type": "roundrobin"
}'

# Consumers
# Consumer for JWT authentication, used for authenticating a route protected by JWT auth
curl -s -i -X PUT "http://127.0.0.1:9180/apisix/admin/consumers" -H "X-API-KEY: $ADMIN_APIKEY" -d '
{
  "username": "joe",
  "plugins": {
    "jwt-auth": {
      "key": "joe_key",
      "secret": "joe_secret"
    }
  }
}'

# Consumer for Key authentication, used for authenticating a route protected by API key auth
curl -s -i -X PUT "http://127.0.0.1:9180/apisix/admin/consumers" -H "X-API-KEY: $ADMIN_APIKEY" -d '
{
  "username": "mike",
  "plugins": {
    "key-auth": {
      "key": "mike_key"
    }
  }
}'

# Routes
# Simple route to internal service
# curl "localhost:9080/anything"
curl -s -i -X PUT "http://localhost:9180/apisix/admin/routes/base_internal" -H "X-API-KEY: $ADMIN_APIKEY" -d '
{
  "uri": "/anything",
  "methods": [
    "GET"
  ],
  "upstream_id": "internal_httpbin"
}'

# Simple route to external service
# curl "localhost:9080/get"
curl -s -i -X PUT "http://localhost:9180/apisix/admin/routes/base_external" -H "X-API-KEY: $ADMIN_APIKEY" -d '
{
  "uri": "/get",
  "methods": [
    "GET"
  ],
  "upstream_id": "external_httpbin"
}'

curl -s -i -X PUT "http://localhost:9180/apisix/admin/routes/base_external" -H "X-API-KEY: $ADMIN_APIKEY" -d '
{
  "uris": [
    "/get",
    "/post"
  ],
  "methods": [
    "GET",
    "POST"
  ],
  "upstream_id": "external_httpbin"
}'

# Route with regex URI transformation
# curl "localhost:9080/httpbin/ip"
curl -s -i -X PUT "http://localhost:9180/apisix/admin/routes/httpbin" -H "X-API-KEY: $ADMIN_APIKEY" -d '
{
  "uri": "/httpbin/*",
  "upstream_id": "internal_httpbin",
  "plugins": {
    "proxy-rewrite": {
      "regex_uri": [
        "^/httpbin/(.*)",
        "/$1"
      ]
    }
  }
}'

# Route with path parameters
# curl "localhost:9080/path_params/foo/bar/get"
curl -s -i -X PUT "http://localhost:9180/apisix/admin/routes/path_params" -H "X-API-KEY: $ADMIN_APIKEY" -d '
{
  "uri": "/path_params/:id1/:id2/*",
  "upstream_id": "internal_httpbin",
  "plugins": {
    "proxy-rewrite": {
      "regex_uri": [
        "^/path_params/(.*)/(.*)/(.*)",
        "/$3?id1=$1&id2=$2"
      ]
    }
  }
}'

# Route with vars matching
# curl "localhost:9080/vars/test?name=joe&age=10"
# curl "localhost:9080/vars/test?name=joe&age=20"
curl -s -i -X PUT "http://localhost:9180/apisix/admin/routes/vars" -H "X-API-KEY: $ADMIN_APIKEY" -d '
{
  "uri": "/vars/*",
  "upstream_id": "internal_httpbin",
  "vars": [
    "AND",
    ["arg_name", "==", "joe"],
    ["arg_age", ">", "18"]
  ],
  "plugins": {
    "proxy-rewrite": {
      "uri": "/get"
    }
  }
}'

# Route with filter_func matching
# curl "localhost:9080/filter_func/test?age=19"
# curl "localhost:9080/filter_func/test?age=20"
curl -s -i -X PUT "http://localhost:9180/apisix/admin/routes/filter_func" -H "X-API-KEY: $ADMIN_APIKEY" -d '
{
  "uri": "/filter_func/*",
  "upstream_id": "internal_httpbin",
  "filter_func": "function(vars); return vars.arg_age and tonumber(vars.arg_age) % 2 == 0; end",
  "plugins": {
    "proxy-rewrite": {
      "uri": "/get"
    }
  }
}'

# Route with JWT authentication
# JWT="eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJrZXkiOiJqb2Vfa2V5Iiwic3ViIjoiMTIzNDU2Nzg5MCIsIm5hbWUiOiJKb2huIERvZSIsImlhdCI6MTUxNjIzOTAyMiwiZXhwIjo5OTUxNjIzOTAyMn0.K-QwAwaS-Y3D9e_S9LPnU_35jWTnOBqfnIXf260Z-Aw"
# curl "localhost:9080/jwt_auth/" -H "Authorization: Bearer ${JWT}"
curl -s -i -X PUT "http://localhost:9180/apisix/admin/routes/jwt_auth" -H "X-API-KEY: $ADMIN_APIKEY" -d '
{
  "uri": "/jwt_auth/*",
  "upstream_id": "internal_httpbin",
  "plugins": {
    "proxy-rewrite": {
      "uri": "/get"
    },
    "jwt-auth": {
      "key": "joe_key",
      "algorithm": "HS256"
    }
  }
}'

# Route with demo plugin
# curl "localhost:9080/demo"
curl -s -i -X PUT "http://localhost:9180/apisix/admin/routes/demo" -H "X-API-KEY: $ADMIN_APIKEY" -d '
{
  "uri": "/demo",
  "upstream_id": "internal_httpbin",
  "plugins": {
    "demo": {
      "body": "Hello from demo plugin!"
    }
  }
}'
