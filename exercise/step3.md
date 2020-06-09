Изучите топологию основных объектов приложения под нагрузкой

## Запустите эмулятор нагрузки

Выполните команду `nohup load.sh [[HOST_IP]] > /tmp/load.log 2>&1 </dev/null &`{{execute T1}}

Вывод эмулятора нагрузки можно посмотреть во вкладке `EMU_Load`

## Изучите топологию приложения

Выполните следующую команду, чтобы сделать доступным Kiali в браузере `nohup kubectl port-forward svc/kiali 20001:20001 -n istio-system --address 0.0.0.0 > /tmp/kiali-pf.log 2>&1 </dev/null &`{{execute T1}}

Откройте Kiali в браузере https://[[HOST_SUBDOMAIN]]-20001-[[KATACODA_HOST]].environments.katacoda.com

Логин/пароль для входа в Kiali `admin/admin`

## Изучите дескрипторы основных объектов приложения

* Deployments
* Pods

### Deployment: Product Page

* получить дескриптор `kubectl -n bookinfo get deployment productpage-v1 -o yaml > /root/exercise/productpage-v1.yaml`{{execute T1}}
* открыть дескриптор в редакторе `/root/exercise/productpage-v1.yaml`{{open}}

### Pods: Details

1. Main Pod
    * получить дескриптор `kubectl -n bookinfo get pod details-main -o yaml > /root/exercise/details-main.yaml`{{execute T1}}
    * открыть дескриптор в редакторе `/root/exercise/details-main.yaml`{{open}}
1. Secondary Pod
    * получить дескриптор `kubectl -n bookinfo get pod details-secondary -o yaml > /root/exercise/details-secondary.yaml`{{execute T1}}
    * открыть дескриптор в редакторе `/root/exercise/details-secondary.yaml`{{open}}

### Deployment: Reviews

* получить дескриптор `kubectl -n bookinfo get deployment reviews-v3 -o yaml > /root/exercise/reviews-v3.yaml`{{execute T1}}
* открыть дескриптор в редакторе `/root/exercise/reviews-v3.yaml`{{open}}

### Deployment: Ratings

* получить дескриптор `kubectl -n bookinfo get deployment ratings-v1 -o yaml > /root/exercise/ratings-v1.yaml`{{execute T1}}
* открыть дескриптор в редакторе `/root/exercise/ratings-v1.yaml`{{open}}

**Внимание!** Чтобы двигаться дальше, сформируйте, пожалуйста, все перечисленные дескрипторы
