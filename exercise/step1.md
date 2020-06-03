This is your first step.

## Kubernetes

Please wait until cluster is initialized in terminal

Ensure all cluster pods are in READY state before proceed any further `kubectl get pods --all-namespaces`{{execute T1}}

## Istio install

Run installer script `/usr/local/bin/istio-install.sh`{{execute T1}}

## Ready check

Check if pods are is READY state `kubectl get pods --all-namespaces`{{execute T1}}

## TroubleShoot

If something goes wrong reload page
