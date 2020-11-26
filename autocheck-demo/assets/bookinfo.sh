#!/bin/sh

export ISTIO_VERSION=1.6.2
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

cp /tmp/bookinfo-no-deployment.yaml $HOME/exercise/bookinfo.yaml

cat $HOME/exercise/bookinfo.yaml | kubectl -n bookinfo apply -f -

