This is your second step.

## Cluster setup

### Kubernetes Dashboard

1. Install Kubernetes Dashboard `kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/v2.0.0/aio/deploy/recommended.yaml`{{execute}}
1. Obtain token `kubectl -n kube-system describe secret $(kubectl -n kube-system get secret | grep default-token | cut -d " " -f1)`{{execute}}
1. Port forward dashboard `kubectl -n kubernetes-dashboard port-forward service/kubernetes-dashboard 443:443 --address 0.0.0.0`{{execute}}
1. Access dashboard using token https://[[HOST_SUBDOMAIN]]-8001-[[KATACODA_HOST]].environments.katacoda.com