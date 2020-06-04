Start online IDE `nohup code-server --bind-addr=[[HOST_IP]] > /tmp/code-server.log 2>&1 </dev/null &`{{execute T1}}

get password `cat ~/.config/code-server/config.yaml | grep password:`{{execute T1}}

login to IDE https://[[HOST_SUBDOMAIN]]-8080-[[KATACODA_HOST]].environments.katacoda.com
