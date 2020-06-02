This is your first step.

## Cluster setup

1. Please wait until cluster is initialized to get dashboard token
2. Port forward kubernetes dashboard `kubectl -n kubernetes-dashboard port-forward service/kubernetes-dashboard 10443:443 --address 0.0.0.0`{{execute T2}}
3. Access dashboard using https://[[HOST_SUBDOMAIN]]-10443-[[KATACODA_HOST]].environments.katacoda.com
