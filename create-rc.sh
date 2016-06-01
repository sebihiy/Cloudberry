#!/bin/sh

kubectl get rc,pod,service -o wide

kubectl delete rc postgresql
kubectl delete rc owncloud
kubectl delete rc nginx
kubectl delete service postgresql
kubectl delete service owncloud
kubectl delete service nginx
kubectl get rc,pod,service -o wide

kubectl create -f postgresql.yaml
kubectl create -f postgresql-service.yaml
kubectl create -f owncloud.yaml
kubectl create -f owncloud-service.yaml
kubectl create -f nginx.yaml
kubectl create -f nginx-service.yaml
kubectl get rc,pod,service -o wide
