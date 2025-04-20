#!/bin/bash
set -e

echo "Creating Kubernetes cluster..."
kind create cluster --config kind-config.yaml --name k8s

echo "Applying database configuration..."
kubectl apply -f init-db-configmap.yaml
kubectl apply -f database.yml

echo "Waiting for database to be ready..."
kubectl wait --for=condition=ready pod -l app=postgres --timeout=90s

echo "Applying API configuration..."
kubectl apply -f api.env.yaml
kubectl apply -f api.yaml

echo "Waiting for API to be ready..."
kubectl wait --for=condition=ready pod -l app=r2s-api --timeout=90s

echo "Setup complete!"