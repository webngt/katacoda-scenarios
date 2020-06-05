#!/bin/sh

# untaint control plane
kubectl taint nodes --all node-role.kubernetes.io/master-

[ ! -d "$HOME/istio-1.6.0/bin" ] && curl -L https://istio.io/downloadIstio | ISTIO_VERSION=1.6.0 sh -
export PATH=$HOME/istio-1.6.0/bin:$PATH
istioctl install --set profile=demo

kubectl -n istio-system patch service istio-ingressgateway -p "$(cat /tmp/node-port.yaml)"
kubectl -n istio-system patch service istio-ingressgateway -p "$(cat /tmp/immutable-ports.yaml)"
kubectl -n istio-system patch service istio-ingressgateway -p "$(cat /tmp/traffic-policy.yaml)"

kubectl -n istio-system patch deployment istio-ingressgateway -p "$(cat /tmp/antiaffinity.yaml)"
kubectl -n istio-system patch deployment istio-ingressgateway -p "$(cat /tmp/replicas.yaml)"