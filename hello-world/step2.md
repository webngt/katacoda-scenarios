This is your second step.

## Cluster setup

### Kubernetes Dashboard

1. Install Kubernetes Dashboard `kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/v2.0.0/aio/deploy/recommended.yaml`{{execute}}
1. Run kubeproxy `kubectl proxy`{{execute}}
1. Access dashboard https://[[HOST_SUBDOMAIN]]-8001-[[KATACODA_HOST]].environments.katacoda.com
