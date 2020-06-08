#!/bin/sh

PATH=$HOME/istio-1.6.0/bin:$PATH istioctl manifest generate --set profile=demo |  kubectl delete -f -
kubectl delete namespace istio

ssh -o "StrictHostKeyChecking no" node01 'ip link set cni0 down'
ssh -o "StrictHostKeyChecking no" node01 'brctl delbr cni0'
ip link set cni0 down
brctl delbr cni0

kubectl scale deployment coredns --replicas=0 -n kube-system
kubectl scale deployment coredns --replicas=2 -n kube-system

sleep 5
kubectl get pods --all-namespaces