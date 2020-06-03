Chaos test application and try to fix the problem

## Chaos test application

Run `nohup chaostest.sh > /tmp/chaos.log 2>&1 </dev/null &`{{execute T1}} to randomly kill pods

## Identify the problem

Use kiali to check how the application degrade over time. Maybe problem is somewhere in application deployment descriptor? 

Application was deployed using bookinfo.yaml

## FixMe

Use your favorite vi editor to identify and fix the problem `vi ~/istio-1.6.0/samples/bookinfo/platform/kube/bookinfo.yaml`{{execute T1}}
