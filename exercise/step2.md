Install application and emulate load

## Install application

Run installer script `/usr/local/bin/bookinfo.sh`{{execute T1}}

## Check application ready status

Run `kubectl -n bookinfo get services && kubectl -n bookinfo get pods`{{execute T1}}

## Expose application for browser access

Run port forward `kubectl port-forward svc/productpage 9080:9080 -n bookinfo --address 0.0.0.0`{{execute T3}}

## Open Application in browser

URL: https://[[HOST_SUBDOMAIN]]-9080-[[KATACODA_HOST]].environments.katacoda.com/productpage

## Emulate load

Run ```load.sh [[HOST_IP]]```{{execute T4}}

## Expose Kiali for browser access

Port forward Kiali `kubectl port-forward svc/kiali 20001:20001 -n istio-system --address 0.0.0.0`{{execute T2}}

## Open Kiali in browser

Open Kiali https://[[HOST_SUBDOMAIN]]-20001-[[KATACODA_HOST]].environments.katacoda.com

## TroubleShoot

If something goes wrong reload page
