Подготовка к тестированию - установка приложения и необходимых инструментов диагностики

## Установить приложение

Запустите скрипт установки `/usr/local/bin/bookinfo.sh`{{execute T1}}

Убедитесь, что все поды приложения находятся в состоянии Running прежде чем двигаться дальше `kubectl -n bookinfo get pods`{{execute T1}}

![Running](./assets/running.png)

Чтобы посмотреть на работу приложения в браузере, выполните `nohup kubectl port-forward svc/productpage 9080:9080 -n bookinfo --address 0.0.0.0 > /tmp/bookinfo-log.log 2>&1 </dev/null &`{{execute T1}}  

Откройте приложение в браузере https://[[HOST_SUBDOMAIN]]-9080-[[KATACODA_HOST]].environments.katacoda.com/productpage

## Запустите эмулятор нагрузки

Выполните команду `nohup load.sh [[HOST_IP]] > /tmp/load.log 2>&1 </dev/null &`{{execute T1}}

## TroubleShoot

Если что-то не работает или зависаает, перезагрузите страницу и начните сценарий заново.
