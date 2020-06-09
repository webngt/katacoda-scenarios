#!/bin/bash

cat <<EOF 

CloudNative checklist

Свойства
    5. Готовность к отказу и автоматическому самовосстановлению любого из компонентов приложения и внешних компонентов/сервисов, от которых оно зависит
    3. Способность соблюдать нефункциональные требования при увеличении нагрузки послев добавления stateless экземпляров компонента

Автоматическая проверка объектов:

EOF

check_object.sh deployment productpage-v1
check_object.sh deployment ratings-v1
check_object.sh deployment reviews-v3
check_object.sh pod details-main
check_object.sh pod details-secondary