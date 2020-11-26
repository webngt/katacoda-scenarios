#!/bin/sh

# untaint control plane
kubectl taint nodes --all node-role.kubernetes.io/master-

# install opa
curl -sS -L -o opa https://openpolicyagent.org/downloads/latest/opa_linux_amd64
chmod 755 opa
mv opa /usr/local/bin

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

