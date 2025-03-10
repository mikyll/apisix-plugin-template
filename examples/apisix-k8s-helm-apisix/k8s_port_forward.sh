#!/bin/bash

kubectl port-forward -n apisix-apisix svc/apisix-data-plane 9080:9080