#!/bin/sh

ensure_label() {
    while [ "$(kubectl -n $2 wait --for=condition=ContainersReady --timeout=5m pods -l $1 2>&1)" = "error: no matching resources found" ]; do
        echo "No pod with label $1 found. Retry..."
        sleep 20
    done
}

# kubectl get pods --all-namespaces
echo "Ensure k8s is properly initialized..."
while [ "$(kubectl get pods --all-namespaces 2>&1)" = "No resources found" ]; do 
    echo "No cluster resource found. Retry..."
    sleep 20
done

echo "Wait for core cluster containers to be ready..."

ensure_label "component=etcd" "kube-system"
ensure_label "component=kube-apiserver" "kube-system"
ensure_label "component=kube-controller-manager" "kube-system"
ensure_label "component=kube-scheduler" "kube-system"
ensure_label "app=flannel" "kube-system"
ensure_label "name=kube-keepalived-vip" "kube-system"
ensure_label "k8s-app=kube-dns" "kube-system"


# untaint control plane
kubectl taint nodes -l node-role.kubernetes.io/master node-role.kubernetes.io/master-

# cni workaround
ssh -o "StrictHostKeyChecking no" node01 'ip link set cni0 down'
ip link set cni0 down

kubectl scale deployment coredns --replicas=0 -n kube-system

while [ "$(kubectl -n kube-system get pods -l k8s-app=kube-dns 2>&1)" != "No resources found in kube-system namespace." ]; do 
    echo "Scaling down core-dns..."
    sleep 5
done

kubectl scale deployment coredns --replicas=2 -n kube-system

ensure_label "k8s-app=kube-dns" "kube-system"


# install opa
curl -sS -L -o opa https://openpolicyagent.org/downloads/latest/opa_linux_amd64
chmod 755 opa
mv opa /usr/local/bin

export ISTIO_VERSION=1.8.1

[ ! -d "$HOME/istio-$ISTIO_VERSION/bin" ] && curl -sS -L https://istio.io/downloadIstio | sh -

export PATH=$HOME/istio-$ISTIO_VERSION/bin:$PATH
[ ! -d "$HOME/exercise" ] && mkdir $HOME/exercise

istioctl install -y --set profile=demo --readiness-timeout='10m0s'
sleep 10

kubectl -n istio-system wait --for=condition=ContainersReady --timeout=5m --all pods

#kubectl -n istio-system scale deployment istio-ingressgateway  --replicas=0

#while [ "$(kubectl -n istio-system get pods -l app=istio-ingressgateway 2>&1)" != "No resources found in istio-system namespace." ]; do 
#    echo "Scaling down istio ingress..."
#    sleep 5
#done

# patch ingress gateway
kubectl -n istio-system patch service istio-ingressgateway -p "$(cat /tmp/node-port.yaml)"
kubectl -n istio-system patch --type="merge" service istio-ingressgateway -p "$(cat /tmp/immutable-ports.yaml)"
#kubectl -n istio-system patch service istio-ingressgateway -p "$(cat /tmp/traffic-policy.yaml)"
#kubectl -n istio-system patch deployment istio-ingressgateway -p "$(cat /tmp/antiaffinity.yaml)"


#kubectl -n istio-system scale deployment istio-ingressgateway  --replicas=2

#echo "Check istio install..."
#sleep 10

#kubectl -n istio-system wait --for=condition=ContainersReady --timeout=5m --all pods

echo "Install Kiali..."

snap install helm3

helm install \
  --namespace istio-system \
  --set auth.strategy="anonymous" \
  --repo https://kiali.org/helm-charts \
  kiali-server \
  kiali-server

kubectl -n istio-system patch service kiali -p "$(cat /tmp/node-port.yaml)"
kubectl -n istio-system patch --type="merge" service kiali -p "$(cat /tmp/immutable-port-kiali.yaml)"

kubectl apply -f https://raw.githubusercontent.com/istio/istio/release-1.8/samples/addons/prometheus.yaml
kubectl apply -f https://raw.githubusercontent.com/istio/istio/release-1.8/samples/addons/jaeger.yaml


kubectl -n istio-system wait --for=condition=ContainersReady --timeout=5m --all pods


echo "Done."
