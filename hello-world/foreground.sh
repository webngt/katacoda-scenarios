git clone https://github.com/webngt/upgraded-guacamole.git

# bootstrap microk8s cluster
export CNLAB_HOME=$(pwd)/upgraded-guacamole

# inject system wide aliases
cat <<EOF >> $HOME/.profile
alias kubectl='sudo microk8s kubectl'
EOF

# ensurre home profile is initialized 
. $HOME/.profile

# inject local environment to bootstrap.sh
cat <<EOF > $CNLAB_HOME/.env_sh
create_node="no"
platform="Linux"
alias snap='sudo snap'
alias microk8s='sudo microk8s'
EOF

$CNLAB_HOME/bootstrap.sh