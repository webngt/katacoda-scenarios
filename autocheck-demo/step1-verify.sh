[ "$(kubectl get pods --all-namespaces)" != "No resources found" ] && 
[ "$(kubectl get pods -l app!=katacoda-cloud-provider -n kube-system -o=jsonpath='{.items[*].status.conditions[?(@.status == "False")].status}')" = "" ]