#!/bin/bash

function print_policy {


    echo -en "\e[32m"
    echo -n "$1" | jq -r ".allow[]"
    echo -en "\e[0m"

    echo -en "\e[91m"
    echo -n "$1" | jq -r ".deny[]"
    echo -en "\e[0m"

    echo -en "\e[91m"
    echo -n "$1" | jq -r ".err[]"
    echo -en "\e[0m"


}


echo -en "\e[93m"
cat <<EOF 

Автоматическая проверка объектов:
EOF
echo -e "\e[0m"

objects=$(kubectl -n bookinfo get deployments,pods,replicasets,destinationrules,peerauthentications -o json 2>&1)

# try without peerauthentications
[ "$objects" = "No resources found" ] && objects=$(kubectl -n bookinfo get deployments,pods,replicasets,destinationrules -o json 2>&1)

# give up
[ "$objects" = "No resources found" ] && echo "$objects" && exit 1

policy=$(echo "$objects" | opa eval -f pretty -I -d /tmp/all.rego "data.k8s.all.policy")

print_policy "$policy"



