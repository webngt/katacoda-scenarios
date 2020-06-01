This is your second step.

## Cluster setup

Before you can start your exercise please install additional components to your cluster
* Kubernetes Dashboard
* Istio

#### Kubernetes Dashboard

1. Deploy metrics server `kubectl apply -f https://github.com/kubernetes-sigs/metrics-server/releases/download/v0.3.6/components.yaml`{{execute T2}}
1. Deploy Dashboard `kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/v2.0.0/aio/deploy/recommended.yaml`{{execute T2}}
1. Check if deployment is ready `kubectl -n kubernetes-dashboard get deployments`{{execute T2}}
1. Obtain token `kubectl -n kube-system describe secret $(kubectl -n kube-system get secret | grep default-token | cut -d " " -f1)`{{execute T2}}
1. Port forward dashboard `kubectl -n kubernetes-dashboard port-forward service/kubernetes-dashboard 443:443 --address 0.0.0.0`{{execute T2}}
1. When the deployment is ready click the link https://[[HOST_SUBDOMAIN>]]-443-[[KATACODA_HOST]].environments.katacoda.com to access kubernetes dashboard using token from the previous steps
