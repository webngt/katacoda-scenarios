#!/bin/bash

# status
status=$(kubectl -n bookinfo get $1 $2 -o json | opa eval -I -d /root/exercise/checklist.rego "data.k8s.replica.count.apply_replicas_count" | 
jq -Mr '.result[0].expressions[0].value.status')

# color
color="\e[0m"

[ "$status" = 0 ] && color="\e[31m"

msg = $(kubectl -n bookinfo get $1 $2 -o json | opa eval -I -d /root/exercise/checklist.rego "data.k8s.replica.count.apply_replicas_count" | 
jq -Mr '.result[0].expressions[0].value.msg')

echo "$2:$color$msg\e[0m\n"

