launch.sh
curl -L https://istio.io/downloadIstio | sh -

export PATH=$HOME/istio-1.7.0/bin:$PATH

istioctl install --set profile=demo
