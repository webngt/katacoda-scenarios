Большинство других примеров модуля **"Istio Hands-On for Kubernetes"**, используют абстракция IstioIngressGateway. 

Поскольку IstioIngressGateway сам является сервисом Kubernetes, то для удобного доступа к нему мы настроили его, как type: NodePort с внешним портом  **30128**.

## Как использовать

1. Изучите пример конфигурации `/root/exercise/3_Gateways_Solution_Gateway/5-application-no-istio.yaml` и `/root/exercise/3_Gateways_Solution_Gateway/6-istio-rules.yaml`. Для удобства откройте их во встроенном редакторе 
    * `/3_Gateways_Solution_Gateway/5-application-no-istio.yaml`{{open}}
    * `/3_Gateways_Solution_Gateway/6-istio-rules.yaml`{{open}}
1. Запустите пример `kubectl apply -f /root/exercise/3_Gateways_Solution_Gateway/5-application-no-istio.yaml && kubectl apply -f /3_Gateways_Solution_Gateway/6-istio-rules.yaml`{{execute T1}}
1. Важно. **Убедитесь, что все поды приложения находятся в статусе Running прежде чем двигаться дальше** `kubectl get pods`{{execute T1}}
1. Откройте UI приложения https://[[HOST_SUBDOMAIN]]-30128-[[KATACODA_HOST]].environments.katacoda.com/ и убедитесь, что вы видите работающее приложения трекинга водителей.

## Удалить вcе объекты

Прежде чем перейти к следующему шагу, удалите все объекты из текущего пространства имен `kubectl delete all --all`{{execute T1}}

## TroubleShoot

Если что-то пошло не так:

* перезагрузите страницу упражнения и начните сценарий заново.