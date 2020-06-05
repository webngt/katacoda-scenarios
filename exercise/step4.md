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

Архитектор внимательно изучает чек-лист стандарта CloudNative и понимает, что нужно исправить пункт? <должен быть квиз>

* нарушение (правильно)
* не правильно
* не правильно

На следующий шаг не пускаем, пока не ответит правильно....


