git clone https://github.com/EvgenyZ54/rego_junit_test

# install code-server editor
curl -fsSL https://code-server.dev/install.sh | sh

# install opa extenstion
code-server --install-extension=tsandall.opa --force

# install opa
curl -L -o opa https://openpolicyagent.org/downloads/latest/opa_linux_amd64
chmod 755 opa
mv opa /usr/local/bin

# ip address
host_ip=$(ifconfig ens3 | sed -En 's/127.0.0.1//;s/.*inet (addr:)?(([0-9]*\.){3}[0-9]*).*/\2/p')
nohup code-server --bind-addr=$host_ip:8080 > /tmp/code-server.log 2>&1 </dev/null &
