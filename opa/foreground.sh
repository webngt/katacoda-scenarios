git clone https://github.com/EvgenyZ54/rego_junit_test

# install code-server editor
curl -fsSL https://code-server.dev/install.sh | sh

# run code-server in background
nohup code-server > /tmp/code-server.log 2>&1 </dev/null &

printf '\n\nUse this password to login to ide\n---------------------------------\n\n' && cat ~/.config/code-server/config.yaml | grep password: && printf '\n'