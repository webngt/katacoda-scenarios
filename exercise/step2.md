This is your second step.

## Install application

1. Check pods and services READY status `kubectl -n bookinfo get services && kubectl -n bookinfo get pods`{{execute}}
1. Check gateway `kubectl -n bookinfo get gateway`{{execute}}
1. Port forward Kiali `kubectl port-forward svc/kiali 20001:20001 -n istio-system --address 0.0.0.0`{{execute T3}}
1. Access Kiali https://[[HOST_SUBDOMAIN]]-20001-[[KATACODA_HOST]].environments.katacoda.com
