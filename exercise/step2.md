Подготовка к тестированию - установка приложения и необходимых инструментов диагностики

## Установить приложение

Запустите скрипт установки `/usr/local/bin/bookinfo.sh`{{execute T1}}

Убедитесь, что все поды приложения находятся в состоянии Running прежде чем двигаться дальше `kubectl -n bookinfo get pods`{{execute T1}}

![Running](./assets/running.png)

Откройте приложение в браузере https://[[HOST_SUBDOMAIN]]-30128-[[KATACODA_HOST]].environments.katacoda.com/productpage

## Запустите эмулятор нагрузки

Выполните команду `nohup load.sh [[HOST_IP]] > /tmp/load.log 2>&1 </dev/null &`{{execute T1}}

## TroubleShoot

Если что-то не работает или зависаает, перезагрузите страницу и начните сценарий заново.
