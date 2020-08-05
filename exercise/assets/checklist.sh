#!/bin/bash

function print_policy {
    allow=$(echo "$1" | jq  -r '.allow[]')
    [ -n "${allow}" ] && echo -e "\e[1mAllow:\e[0m \e32m$alllow\e[0m"

    deny=$(echo "$1" | jq  -r '.deny[]')
    [ -n "${deny}" ] && echo -e "\e[1mDeny:\e[0m \e[91m$deny\e[0m"

    err=$(echo "$1" | jq  -r '.err[]')
    [ -n "${err}" ] && echo -e "\e[1mError:\e[0m \e[91m$err\e[0m"
}


echo -e "\e[93m"
cat <<EOF 

CloudNative checklist

Свойства
    5. Готовность к отказу и автоматическому самовосстановлению любого из компонентов приложения и внешних компонентов/сервисов, от которых оно зависит
    3. Способность соблюдать нефункциональные требования при увеличении нагрузки послев добавления stateless экземпляров компонента

Автоматическая проверка объектов:
EOF
echo -e "\e[0m"

# policies
deployments=$(kubectl -n bookinfo get deployments | opa eval -f pretty -I -d /tmp/deployment.rego "data.k8s.deployment.policy")
pods=$(kubectl -n bookinfo get pods | opa eval -f pretty -I -d /tmp/pod.rego "data.k8s.pod.policy")
replicasets=$(kubectl -n bookinfo get replicasets | opa eval -f pretty -I -d /tmp/replicaset.rego "data.k8s.pod.replicaset")

print_policy($deployments)

