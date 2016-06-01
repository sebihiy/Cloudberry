kubectl delete rc postgresql
kubectl delete pod postgresql
kubectl delete rc owncloud
kubectl delete pod owncloud
kubectl delete rc nginx
kubectl delete service postgresql
kubectl delete service owncloud
kubectl delete service nginx
kubectl get pod,rc,service -o wide
