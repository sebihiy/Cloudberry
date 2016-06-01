#!/bin/sh

# -q quiet
# -c nb of pings to perform
ping -q -c5 192.168.1.52 > /dev/null

if [ $? != 0 ]
then
cd /root/scripts
kubectl delete pod postgresql
kubectl delete pod owncloud
#kubectl delete rc nginx
kubectl delete service postgresql
kubectl delete service owncloud
#kubectl delete service nginx
kubectl create -f postgresql-pod.yaml
kubectl create -f postgresql-service.yaml
kubectl create -f owncloud-pod.yaml
kubectl create -f owncloud-service.yaml
#kubectl create -f nginx.yaml
#kubectl create -f nginx-service.yaml
fi

ping -q -c5 192.168.1.53 > /dev/null

if [ $? != 0 ]
then
cd /root/scripts
kubectl delete pod postgresql
kubectl delete pod owncloud
#kubectl delete rc nginx
kubectl delete service postgresql
kubectl delete service owncloud
#kubectl delete service nginx
kubectl get pod -o wide
ping -q -c35 192.168.1.53 > /dev/null
kubectl delete service postgresql
kubectl delete pod owncloud
kubectl get pod -o wide

kubectl create -f postgresql-pod.yaml
kubectl create -f postgresql-service.yaml
kubectl create -f owncloud-pod.yaml
kubectl create -f owncloud-service.yaml
#kubectl create -f nginx.yaml
#kubectl create -f nginx-service.yaml
kubectl get pod -o wide
fi

