#!/bin/sh

kubectl -n bookinfo get $1 $2 -o json | opa eval -I -d /root/exercise/checklist.rego "data.k8s.replica.count.apply_replicas_count" | jq '.result[0].expressions[0].value.msg'