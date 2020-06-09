#!/bin/sh

# ensure kubernetes is initialized
while [ "$(kubectl get pods -l app!=katacoda-cloud-provider -n kube-system -o=jsonpath='{.items[*].status.conditions[?(@.status == "False")].status}')" != "" ]; do 
    sleep 10
    echo "Ensure k8s is properly initialized"
done

kubectl get pods --all-namespaces


# untaint control plane
kubectl taint nodes --all node-role.kubernetes.io/master-

# install opa
curl -L -o opa https://openpolicyagent.org/downloads/latest/opa_linux_amd64
chmod 755 opa
mv opa /usr/local/bin

[ ! -d "$HOME/istio-1.6.0/bin" ] && curl -L https://istio.io/downloadIstio | ISTIO_VERSION=1.6.0 sh -

export PATH=$HOME/istio-1.6.0/bin:$PATH
[ ! -d "$HOME/exercise" ] && mkdir $HOME/exercise

# cni workaround
ssh -o "StrictHostKeyChecking no" node01 'ip link set cni0 down'
ssh -o "StrictHostKeyChecking no" node01 'brctl delbr cni0'
ip link set cni0 down
brctl delbr cni0
kubectl scale deployment coredns --replicas=0 -n kube-system
kubectl scale deployment coredns --replicas=2 -n kube-system

while [ "$(kubectl get pods -l app!=katacoda-cloud-provider -n kube-system -o=jsonpath='{.items[*].status.conditions[?(@.status == "False")].status}')" != "" ]; do 
    sleep 10
    echo "Ensure k8s is properly initialized"
done

kubectl get pods --all-namespaces


istioctl install --set profile=demo --readiness-timeout='10m0s'
kubectl -n istio-system patch service istio-ingressgateway -p "$(cat /tmp/node-port.yaml)"
kubectl -n istio-system patch service istio-ingressgateway -p "$(cat /tmp/immutable-ports.yaml)"
kubectl -n istio-system patch service istio-ingressgateway -p "$(cat /tmp/traffic-policy.yaml)"

kubectl -n istio-system patch deployment istio-ingressgateway -p "$(cat /tmp/antiaffinity.yaml)"

#kubectl -n istio-system patch deployment istio-ingressgateway -p "$(cat /tmp/replicas.yaml)"
kubectl -n istio-system scale deployment istio-ingressgateway  --replicas=0
kubectl -n istio-system scale deployment istio-ingressgateway  --replicas=2