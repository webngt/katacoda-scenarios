#!/bin/sh

kubectl -n bookinfo get deployment productpage-v1 -o yaml > /root/exercise/productpage-v1.yaml
kubectl -n bookinfo get pod details-main -o yaml > /root/exercise/details-main.yaml
kubectl -n bookinfo get pod details-secondary -o yaml > /root/exercise/details-secondary.yaml
kubectl -n bookinfo get deployment reviews-v3 -o yaml > /root/exercise/reviews-v3.yaml
kubectl -n bookinfo get deployment ratings-v1 -o yaml > /root/exercise/ratings-v1.yaml