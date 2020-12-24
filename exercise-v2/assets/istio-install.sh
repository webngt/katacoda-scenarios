#!/bin/sh

function ensure_label {
    while [ "$(kubectl -n $2 wait --for=condition=ContainersReady --timeout=5m pods -l $1)" = "error: no matching resources found"]; do
        echo "Retry..."
        sleep 20
    done
}

# kubectl get pods --all-namespaces
while [ "$(kubectl get pods --all-namespaces)" = "No resources found" ]; do 
    echo "Ensure k8s is properly initialized...No resources found"
    sleep 10
done

ensure_label("component=etcd", "kube-system")
ensure_label("component=kube-apiserver", "kube-system")
ensure_label("component=kube-controller-manager", "kube-system")
ensure_label("component=kube-scheduler", "kube-system")
ensure_label("app=flannel", "kube-system")
ensure_label("name=kube-keepalived-vip", "kube-system")
ensure_label("k8s-app=kube-dns", "kube-system")


# untaint control plane
kubectl taint nodes -l node-role.kubernetes.io/master node-role.kubernetes.io/master-

# install opa
curl -sS -L -o opa https://openpolicyagent.org/downloads/latest/opa_linux_amd64
chmod 755 opa
mv opa /usr/local/bin

export ISTIO_VERSION=1.8.1

[ ! -d "$HOME/istio-$ISTIO_VERSION/bin" ] && curl -sS -L https://istio.io/downloadIstio | sh -

export PATH=$HOME/istio-$ISTIO_VERSION/bin:$PATH
[ ! -d "$HOME/exercise" ] && mkdir $HOME/exercise

# cni workaround
ssh -o "StrictHostKeyChecking no" node01 'ip link set cni0 down'
ip link set cni0 down

kubectl scale deployment coredns --replicas=0 -n kube-system
sleep 20
kubectl scale deployment coredns --replicas=2 -n kube-system

ensure_label("k8s-app=kube-dns", "kube-system")

while [ "$(kubectl get pods -l app!=katacoda-cloud-provider -n kube-system -o=jsonpath='{.items[*].status.conditions[?(@.status == "False")].status}')" != "" ]; do 
    echo "Ensure k8s is properly initialized..."
    sleep 10
done



istioctl install --set profile=demo --readiness-timeout='10m0s'
sleep 10

# scale down istio ingress
kubectl -n istio-system scale deployment istio-ingressgateway  --replicas=0
while [ "$(kubectl get pods -l app=istio-ingressgateway -n istio-system -o=jsonpath='{.items[*].status.conditions[?(@.status == "False")].status}')" != "" ]; do 
    echo "Scaling down istio-ingressgateway...."
    sleep 10
done

# patch ingress gateway
kubectl -n istio-system patch service istio-ingressgateway -p "$(cat /tmp/node-port.yaml)"
kubectl -n istio-system patch service istio-ingressgateway -p "$(cat /tmp/immutable-ports.yaml)"
kubectl -n istio-system patch service istio-ingressgateway -p "$(cat /tmp/traffic-policy.yaml)"
kubectl -n istio-system patch deployment istio-ingressgateway -p "$(cat /tmp/antiaffinity.yaml)"


kubectl -n istio-system scale deployment istio-ingressgateway  --replicas=2
while [ "$(kubectl get pods -n istio-system -o=jsonpath='{.items[*].status.conditions[?(@.status == "False")].status}')" != "" ]; do 
    echo "Scaling up istio-ingressgateway...."
    sleep 10
done

kubectl get pods -n istio-system
echo "Done."


# app=istio-ingressgateway