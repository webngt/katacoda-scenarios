#!/bin/sh

istio_root=$HOME/istio-1.6.0

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

cp /tmp/bookinfo-no-deployment.yaml $HOME/excercise/bookinfo.yaml
cp /tmp/checklist.rego $HOME/excercise/checklist.rego

cat $HOME/excercise/bookinfo.yaml | kubectl -n bookinfo apply -f -

cat $istio_root/samples/bookinfo/networking/bookinfo-gateway.yaml | kubectl -n bookinfo apply -f - 

cat $istio_root/samples/bookinfo/networking/destination-rule-all-mtls.yaml | kubectl -n bookinfo apply -f -

echo "Ingress node port: $(kubectl -n istio-system get service istio-ingressgateway -o jsonpath='{.spec.ports[?(@.name=="http2")].nodePort}')"
