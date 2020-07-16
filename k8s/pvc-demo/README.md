#Schema:
#NFS Server <-> NFS Client Provisioner <-> k8s master <-> Pod

#Manual:
#1. Install & configure NFS server
yum install nfs-utils

#2. Dir for NFS
mkdir /srv/nfs/kubedata -p
chown nobody:  /srv/nfs/kubedata
systemctl enable nfs-server
systemctl start nfs-server
#(and check firewall just to be sure)


#4. Exports
vi /etc/exports
/srv/nfs/kubedata       *(rw,sync,no_subtree_check,no_root_squash,no_all_squash,insecure)
exportfs -rav
view
exportfs -v

#5. mount from worker - test
#!!!install on ALL worker's nodes
yum install nfs-utils
mount -t nfs <<IP ADDRESS>>:/srv/nfs/kubedata /mnt
umount /mnt/

#6. Deploy NFS client provisiioner
https://github.com/kubernetes-incubator/external-storage/tree/master/nfs-client/deploy


kubectl create -f rbac.yaml
kubectl get clusterrole,clusterrolebinding,role,rolebinding | grep nfs

kubectl create -f class.yaml

#deploy nfs client
kubectl create -f deployment.yaml

#test
kubectl exec -it <<POD nfs client provisioner>> ls /persistentvolumes


#7. Run pvc
kubectl -f pvc1.yaml -f pvc2.yaml
kubectl get pv,pvc
#volume got created automaticaly

#check dirs  on NFS server
ls /srv/nfs/kubedata

#8. Connect PV to pod
kubectl -f pod-with-pv.yaml

#check mount
kubectl describe  pod-with-pv



