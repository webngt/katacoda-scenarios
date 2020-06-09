#!/bin/bash

# status
status=$(kubectl -n bookinfo get $1 $2 -o json | opa eval -I -d /root/exercise/checklist.rego "data.k8s.replica.count.apply_replicas_count" | 
jq -Mr '.result[0].expressions[0].value.status')

# color
color="\e[92m"

[ "$status" = "0" ] && color="\e[31m"

msg=$(kubectl -n bookinfo get $1 $2 -o json | opa eval -I -d /root/exercise/checklist.rego "data.k8s.replica.count.apply_replicas_count" | 
jq -Mr '.result[0].expressions[0].value.msg')

#echo -e "\e1mproductpage-v1:\e[0m\e[91m Проверка на кол-во реплик не пройдена. Реплик: 1\e[0m\n"
echo -e "\e[1m$2:\e[0m $color$msg\e[0m"

