This is your first step.

## Cluster setup

1. Please wait until cluster is initialized
1. Check if pods are is READY state `kubectl get pods --all-namespaces`{{execute T1}}
1. Port forward Kiali `kubectl port-forward svc/kiali 20001:20001 -n istio-system --address 0.0.0.0`{{execute T2}}
1. Access Kiali https://[[HOST_SUBDOMAIN]]-20001-[[KATACODA_HOST]].environments.katacoda.com

## TroubleShoot

Restart cluster

1. Stop microk8s `sudo microk8s stop`{{execute T1}}
1. Start microk8s `sudo microk8s start`{{execute T1}}

If nothing helps reload page
