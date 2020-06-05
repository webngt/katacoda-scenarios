#!/bin/sh

# untaint control plane
kubectl taint nodes --all node-role.kubernetes.io/master-

[ ! -d "$HOME/istio-1.6.0/bin" ] && curl -L https://istio.io/downloadIstio | ISTIO_VERSION=1.6.0 sh -
export PATH=$HOME/istio-1.6.0/bin:$PATH
istioctl install --set profile=demo
