
#!/bin/sh

kubectl create -f postgresql-pod.yaml
kubectl create -f postgresql-service.yaml
kubectl create -f owncloud-pod.yaml
kubectl create -f owncloud-service.yaml
kubectl create -f nginx.yaml
kubectl create -f nginx-service.yaml
kubectl get rc,pod,service -o wide
