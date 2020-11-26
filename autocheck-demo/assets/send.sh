#!/bin/bash

read -p "Enter token: " token

kubectl -n bookinfo get deployments -o json | \
opa eval -f pretty -I -d /tmp/deployment.rego "data.k8s.deployment.policy" | \
curl -d @- -H "Authorization: Bearer $token" -H "Content-Type: application/json" -X POST https://d5d934qvpovuk7t4g195.apigw.yandexcloud.net/check