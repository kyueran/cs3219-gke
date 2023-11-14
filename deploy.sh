#!/bin/bash

#Follow this order ConfigMap, PVC, Deployments, Services, Ingress

# Apply secrets and configmaps
kubectl apply -f ./secret-configs/firebase-secret.yaml
kubectl apply -f ./secret-configs/supabase-secret.yaml
kubectl apply -f ./secret-configs/backend-config.yaml
kubectl apply -f ./secret-configs/frontend-config.yaml
kubectl apply -f ./secret-configs/peerprep-com-tls-secret.yaml
kubectl apply -f ./j0/j0-db-config.yaml

# Apply PVCs
kubectl apply -f ./j0/j0-postgres-pvc.yaml
kubectl apply -f ./j0/j0-redis-pvc.yaml

#judge0
kubectl apply -f ./j0/j0-workers-deployment.yaml
kubectl apply -f ./j0/j0-server-service.yaml
kubectl apply -f ./j0/j0-postgres-service.yaml
kubectl apply -f ./j0/j0-redis-service.yaml

# Apply Deployments and Services
kubectl apply -f ./deployments-services/question-service.yaml
kubectl apply -f ./deployments-services/matching-service.yaml
kubectl apply -f ./deployments-services/user-service.yaml
kubectl apply -f ./deployments-services/room-service.yaml
kubectl apply -f ./deployments-services/video-token-service.yaml
kubectl apply -f ./deployments-services/frontend.yaml

# Apply ingress
kubectl apply -f ./ingress/peer-prep-ingress.yaml
