This is your first step.

## Istio setup

1. Please wait until cluster is initialized
1. Run installer script `/usr/local/bin/istio-install.sh`{{execute}}
1. Check if pods are is READY state `kubectl get pods --all-namespaces`{{execute T1}}
1. Port forward Kiali `kubectl port-forward svc/kiali 20001:20001 -n istio-system --address 0.0.0.0`{{execute T2}}
1. Open Kiali https://[[HOST_SUBDOMAIN]]-20001-[[KATACODA_HOST]].environments.katacoda.com

## TroubleShoot

If something goes wrong reload page
