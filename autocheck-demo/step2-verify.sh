[ "$(kubectl get pods -n bookinfo -o=jsonpath='{.items[*].status.conditions[?(@.status == "False")].status}')" = "" ] && echo "done"