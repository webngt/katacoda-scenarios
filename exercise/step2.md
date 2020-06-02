This is your second step.

## Install application

1. Run installer script `/usr/local/bin/bookinfo.sh`{{execute T1}}
1. Check pods and services READY status `kubectl -n bookinfo get services && kubectl -n bookinfo get pods`{{execute T1}}
1. Check gateway `kubectl -n bookinfo get gateway`{{execute T1}}
