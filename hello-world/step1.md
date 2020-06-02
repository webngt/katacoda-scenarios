This is your first step.

## Cluster setup

1. Please wait until cluster is initialized
1. Check if pods are is READY state `kubectl get pods --all-namespaces`{{execute T1}}
1. Get dashboard token `kubectl -n kube-system describe secret $(kubectl -n kube-system get secret | grep default-token | cut -d " " -f1)`{{execute T1}}
1. Port forward kubernetes dashboard `kubectl port-forward -n kube-system service/kubernetes-dashboard 10443:443 --address 0.0.0.0`{{execute T2}}
1. Access dashboard using https://[[HOST_SUBDOMAIN]]-10443-[[KATACODA_HOST]].environments.katacoda.com

## TroubleShoot

Restart cluster

1. Stop microk8s `sudo microk8s stop`{{execute T1}}
1. Start microk8s `sudo microk8s start`{{execute T1}}

If nothing helps reload page
