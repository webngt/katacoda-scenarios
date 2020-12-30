#!/bin/sh

export ISTIO_VERSION=1.8.1
istio_root=$HOME/istio-$ISTIO_VERSION

cat <<EOF | kubectl create -f -
{
  "apiVersion": "v1",
  "kind": "Namespace",
  "metadata": {
    "name": "bookinfo",
    "labels": {
      "name": "bookinfo",
      "istio-injection": "enabled"
    }
  }
}
EOF

kubectl describe namespace bookinfo

kubectl -n bookinfo apply -f /tmp/bookinfo-no-deployment.yaml

kubectl -n bookinfo apply -f /tmp/destination-rule-all-mtls.yaml

echo "Ingress node port: $(kubectl -n istio-system get service istio-ingressgateway -o jsonpath='{.spec.ports[?(@.name=="http2")].nodePort}')"
