Некоторые примеры в модуле **"Istio Hands-On for Kubernetes"**, используют конфигурацию сервисов с использованием типа NodePort. При этом, в таких примерах не используется абстракция IstioIngressGateway. 

Вы можете встретить такие конфигурации в файлах 5-application-no-istio.yaml

```yaml
apiVersion: v1
kind: Service
metadata:
  name: fleetman-webapp
spec:
  selector:
    app: webapp
  ports:
    - name: http
      port: 80
      nodePort: 30080
  type: NodePort
```

Это означает, что сервис fleetman-web-app доступен извне по порту 30080 (значение параметра NodePort). 

## Как использовать

1. Изучите пример конфигурации `/root/exercise/1_Telemetry/5-application-no-istio.yaml`. Для удобства вы его можете открыть во встроенном редакторе `/1_Telemetry/5-application-no-istio.yaml`{{open}}. 
1. Запустите пример `kubectl apply -f /root/exercise/1_Telemetry/5-application-no-istio.yaml`{{execute T1}}
1. Убедитесь, что все поды приложения находятся состоянии Running прежде чем двигаться дальше `kubectl get pods`{{execute T1}}
1. Откройте UI приложения https://[[HOST_SUBDOMAIN]]-30080-[[KATACODA_HOST]].environments.katacoda.com/ и убедитесь, что вы видите работающее приложения трекинга водителей. Так образом платформа Katacoda производит маппинг порта 30080 вашего полигона на внешние общедуоступные ссылки. 
1. Повторите за автором модуля **"Istio Hands-On for Kubernetes"** все действия из раздела **"Section 5: Telemetry"** начиная с пункта **"16. Kiali Deeper Dive"**

## Удалить вcе объекты

Прежде чем перейти к следующему шагу, удалите все объекты из текущего пространства имен `kubectl delete all --all`{{execute T1}}

## TroubleShoot

* перезагрузите страницу упражнения и начните сценарий заново.