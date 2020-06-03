Install application and emulate load

## Install application

Run installer script `/usr/local/bin/bookinfo.sh`{{execute T1}}

Ensure all application pods are in READY state before proceed any further `kubectl -n bookinfo get pods`{{execute T1}}

Expose application for browser access `nohup kubectl port-forward svc/productpage 9080:9080 -n bookinfo --address 0.0.0.0 > /tmp/bookinfo-log.log 2>&1 </dev/null &`{{execute T1}}

Open Application in browser: https://[[HOST_SUBDOMAIN]]-9080-[[KATACODA_HOST]].environments.katacoda.com/productpage

## Emulate load

Run `nohup load.sh [[HOST_IP]] > /tmp/load.log 2>&1 </dev/null &`{{execute T1}}

## Observe application with Kiali

Port forward Kiali `nohup kubectl port-forward svc/kiali 20001:20001 -n istio-system --address 0.0.0.0 > /tmp/kiali-pf.log 2>&1 </dev/null &`{{execute T1}}

Open Kiali https://[[HOST_SUBDOMAIN]]-20001-[[KATACODA_HOST]].environments.katacoda.com

## TroubleShoot

If something goes wrong reload page
