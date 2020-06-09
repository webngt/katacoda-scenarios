Изучите топологию основных объектов приложения под нагрузкой

## Запустите эмулятор нагрузки

Выполните команду `nohup load.sh [[HOST_IP]] > /tmp/load.log 2>&1 </dev/null &`{{execute T1}}

Вывод эмулятора нагрузки можно посмотреть во вкладке `EMU_Load`

## Изучите топологию приложения

Выполните следующую команду, чтобы сделать доступным Kiali в браузере `nohup kubectl port-forward svc/kiali 20001:20001 -n istio-system --address 0.0.0.0 > /tmp/kiali-pf.log 2>&1 </dev/null &`{{execute T1}}

Откройте Kiali в браузере https://[[HOST_SUBDOMAIN]]-20001-[[KATACODA_HOST]].environments.katacoda.com

Логин/пароль для входа в Kiali `admin/admin`

## Изучите дескрипторы основных объектов приложения

1. Services
    1. Product Page
    1. Details
    1. Reviews
    1. Ratings
1. Deployments и Pods
    1. Product Page
    1. Details
    1. Reviews
    1. Ratings
