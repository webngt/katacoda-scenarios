Install application and emulate load

## Install application

1. Run installer script `/usr/local/bin/bookinfo.sh`{{execute T1}}
1. Wait for pods and services READY status `kubectl -n bookinfo get services && kubectl -n bookinfo get pods`{{execute T1}}
1. Check gateway `kubectl -n bookinfo get gateway`{{execute T1}}
1. Port forward application `kubectl port-forward svc/productpage 9080:9080 -n bookinfo --address 0.0.0.0`{{execute T3}}
1. Application url https://[[HOST_SUBDOMAIN]]-9080-[[KATACODA_HOST]].environments.katacoda.com/productpage

## Emulate load

1. Run ```watch -n 0.5 curl -o /dev/null -s -w %{http_code} [[HOST_IP]]:$(kubectl -n istio-system get service istio-ingressgateway -o jsonpath='{.spec.ports[?(@.name=="http2")].nodePort}')/productpage```{{execute T4}}

## Check application in Kiali

1. Port forward Kiali `kubectl port-forward svc/kiali 20001:20001 -n istio-system --address 0.0.0.0`{{execute T2}}
1. Open Kiali https://[[HOST_SUBDOMAIN]]-20001-[[KATACODA_HOST]].environments.katacoda.com

## TroubleShoot

If something goes wrong reload page
