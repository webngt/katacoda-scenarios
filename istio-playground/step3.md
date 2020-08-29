попробуйте выполнить следующий пример

1. Изучите пример конфигурации `exercise/1_Telemetry/5-application-no-istio.yaml`{{open}}
1. Запустите пример `kubectl apply -f /root/exercise/1_Telemetry/5-application-no-istio.yaml`{{execute T1}}
1. Убедитесь, что все поды приложения находятся состоянии Running прежде чем двигаться дальше `kubectl get pods`{{execute T1}}
1. Откройте UI приложения https://[[HOST_SUBDOMAIN]]-30080-[[KATACODA_HOST]].environments.katacoda.com/ и убедитесь, что вы видите работающее приложения трекинга водителей
1. Повторите за автором модуля **"Istio Hands-On for Kubernetes"** все действия из раздела **"Section 5: Telemetry"** начиная с пункта **"16. Kiali Deeper Dive"**

## Удалить вcе объекты

Прежде чем перейти к следующему шагу, удалите все объекты из текущего пространства имен `kubectl delete all --all`{{execute T1}}