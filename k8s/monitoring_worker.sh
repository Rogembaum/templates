# kube-proxy
kubectl -n kube-system get configmap kube-proxy -o yaml | sed 's/metricsBindAddress: ""/metricsBindAddress: "0.0.0.0:10249"/g' | kubectl apply -f -
podID=`crictl pods --label k8s-app=kube-proxy -q`
crictl stopp $podID
crictl rmp $podID

# kube-controller-manager
sed -i 's/bind-address=127.0.0.1/bind-address=0.0.0.0/g' /etc/kubernetes/manifests/kube-controller-manager.yaml
podID=`crictl pods --label component=kube-controller-manager -q`
crictl stopp $podID
crictl rmp $podID

# kube-scheduler
sed -i 's/bind-address=127.0.0.1/bind-address=0.0.0.0/g' /etc/kubernetes/manifests/kube-scheduler.yaml
podID=`crictl pods --label component=kube-scheduler -q`
crictl stopp $podID
crictl rmp $podID