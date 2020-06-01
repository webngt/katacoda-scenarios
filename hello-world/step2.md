This is your second step.

## Cluster setup

### Kubernetes Dashboard

1. Deploy Dashboard `kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/v2.0.0/aio/deploy/recommended.yaml`{{execute "dashboard"}}
1. Check if deployment is ready `kubectl -n kubernetes-dashboard get deployments`{{execute "dashboard"}}
1. Obtain token `kubectl -n kube-system describe secret $(kubectl -n kube-system get secret | grep default-token | cut -d " " -f1)`{{execute "dashboard"}}
1. Port forward dashboard `kubectl -n kubernetes-dashboard port-forward service/kubernetes-dashboard 443:443 --address 0.0.0.0`{{execute "dashboard"}}
1. Access dashboard using token https://[[HOST_SUBDOMAIN]]-443-[[KATACODA_HOST]].environments.katacoda.com
