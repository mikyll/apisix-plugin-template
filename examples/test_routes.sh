#!/bin/bash

read -p 'curl -i "localhost:9080/anything"'
curl -i "localhost:9080/anything"

echo ""
read -p 'curl -i "localhost:9080/get"'
curl -i "localhost:9080/get"

echo ""
read -p 'curl -i "localhost:9080/httpbin/ip"'
curl -i "localhost:9080/httpbin/ip"

echo ""
read -p 'curl -i "localhost:9080/path_params/foo/bar/get"'
curl -i "localhost:9080/path_params/foo/bar/get"

echo ""
read -p 'curl -i "localhost:9080/timeout/1"'
curl -i "localhost:9080/timeout/1"
echo ""
read -p 'curl -i "localhost:9080/timeout/3"'
curl -i "localhost:9080/timeout/3"

echo ""
read -p 'curl -i "localhost:9080/vars/test?name=joe&age=10"'
curl -i "localhost:9080/vars/test?name=joe&age=10"
echo ""
read -p 'curl -i "localhost:9080/vars/test?name=joe&age=20"'
curl -i "localhost:9080/vars/test?name=joe&age=20"

echo ""
read -p 'curl -i "localhost:9080/filter_func/test?age=19"'
curl -i "localhost:9080/filter_func/test?age=19"
echo ""
read -p 'curl -i "localhost:9080/filter_func/test?age=20"'
curl -i "localhost:9080/filter_func/test?age=20"

echo ""
read -p 'API_KEY=""; curl -i "localhost:9080/key_auth/"'
API_KEY=""
curl -i "localhost:9080/key_auth/"
echo ""
API_KEY="mike_key"
read -p 'API_KEY="mike_key"; curl -i "localhost:9080/key_auth/" -H "X-Api-Key: ${API_KEY}"'
curl localhost:9080/key_auth/ -H "X-Api-Key: ${API_KEY}"

echo ""
read -p 'JWT=""; curl -i "localhost:9080/jwt_auth/"'
JWT=""
curl -i "localhost:9080/jwt_auth/"
echo ""
read -p 'curl -i "localhost:9080/jwt_auth/" -H "Authorization: Bearer ${JWT}"'
curl -i "localhost:9080/jwt_auth/" -H "Authorization: Bearer ${JWT}"
echo ""
read -p 'JWT="correct_token"; curl -i "localhost:9080/jwt_auth/" -H "Authorization: Bearer ${JWT}"'
JWT="eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJrZXkiOiJqb2Vfa2V5Iiwic3ViIjoiMTIzNDU2Nzg5MCIsIm5hbWUiOiJKb2huIERvZSIsImlhdCI6MTUxNjIzOTAyMiwiZXhwIjo5OTUxNjIzOTAyMn0.K-QwAwaS-Y3D9e_S9LPnU_35jWTnOBqfnIXf260Z-Aw"
curl -i "localhost:9080/jwt_auth/" -H "Authorization: Bearer ${JWT}"

echo ""
read -p 'curl -i "localhost:9080/demo"'
curl -i "localhost:9080/demo"
echo ""
read -p 'curl -i "localhost:9080/apisix/plugin/demo/public_api"'
curl -i "localhost:9080/apisix/plugin/demo/public_api"
