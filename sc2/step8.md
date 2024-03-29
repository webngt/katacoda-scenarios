Теперь, когда мы убедились в работоспособности пути ingress-шлюз -> ServiceA -> SericeC -> external-cluster, давайте переключим 100% трафика из ServiceA в ServiceC.

Для этого нам нужно будет обновить манифест producer-internal-host-vs.

Схема сети:

![Mesh configuration](../assets/c2-5.png)

Рассмотрим новую версию:
```
apiVersion: networking.istio.io/v1alpha3
kind: VirtualService
metadata:
  name: producer-internal-host-vs
spec:
  hosts:
    - producer-internal-host
  gateways:
    - mesh
  http:
    - route:
        - destination:
            host: service-c-srv
            port:
              number: 80
```

Как видите, теперь в блоке destination присутствует только хост service-c-srv, который ведет на ServiceC. Напомню, ServiceA продолжит высылать запросы на хост producer-internal-host. Но сработает перенаправление на ServiceC, вместо ServiceB.

Применим манифест:
`kubectl apply -f producer-internal-host-100-c-vs.yml`{{execute}}

Совершим несколько запросов на ingress-шлюз:
`curl -v http://$GATEWAY_URL/service-a`{{execute}}

Теперь все ответы из ServiceC:
```
Hello from ServiceA! Calling Producer Service... Received response from Producer Service: Hello from Service-EXT! Calling master system API... Received response from master system (http://istio-ingressgateway.istio-system.svc.cluster.local/service-ext): Hello from External Cluster Service!
```
