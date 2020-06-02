This is your first step.

## Cluster setup

1. Please wait until cluster is initialized
1. Get dashboard token

  ```bash
  token=$(kubectl -n kube-system get secret | grep default-token | cut -d " " -f1)
  kubectl -n kube-system describe secret $token
  ```{{execute}}
1. Port forward kubernetes dashboard `kubectl port-forward -n kube-system service/kubernetes-dashboard 10443:443 --address 0.0.0.0`{{execute T2}}
1. Access dashboard using https://[[HOST_SUBDOMAIN]]-10443-[[KATACODA_HOST]].environments.katacoda.com
