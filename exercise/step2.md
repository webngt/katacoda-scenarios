This is your second step.

## Install istio

1. Enable istio `microk8s enable istio`{{execute T3}}
1. Port forward Kiali `kubectl port-forward svc/kiali 20001:20001 -n istio-system --address 0.0.0.0`{{execute T3}}
1. Access Kiali https://[[HOST_SUBDOMAIN]]-20001-[[KATACODA_HOST]].environments.katacoda.com
