хаос тестирование.

## Методика

Случайным образом в цикле производим остановку подов (pods) приложения. 

Для этого хаос инжененер подготовил скрипт автоматизациии. 

```bash
#!/bin/bash

while true
do
    echo "Choosing a pod to kill..."
    PODS=$(kubectl -n bookinfo get pods | grep -v NAME | awk '{print $1}')
    POD_COUNT=$(kubectl -n bookinfo get pods | grep -v NAME | wc -l)
    K=$(( ( $RANDOM % $POD_COUNT ) + 1))
    TARGET_POD=$(kubectl -n bookinfo get pods | grep -v NAME | awk '{print $1}' | head -n ${K} | tail -n 1)
    echo "Killing pod ${TARGET_POD}"
    kubectl -n bookinfo delete pod $TARGET_POD
    sleep 1
done
```

## Запуск хаос-теста

Выполните `nohup chaostest.sh > /tmp/chaos.log 2>&1 </dev/null &`{{execute T1}} 

## Локализуйте проблему

Архитектор наблюдает за деградацией приложения в Kiali.

## Сформулируйте рекомендации по исправлению

>>Выбрать пункты, относящиеся к правильному пути решения<<
[ ] Перезапустить кластер
[*] Проверить yaml файлы сервисов приложения
[*] Внести исправления в yaml файлы
[ ] Перезапустить Istio
[*] Выполнить команду `kubectl -n bookinfo apply -f <YAML сервиса приложения>`
[ ] Удалить namespace приложения `kubectl delete namespace bookinfo`
