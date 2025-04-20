#!/bin/bash
set -e

# Get the pod name
DATABASE_POD=$(kubectl get pod -l app=postgres -o jsonpath='{.items[0].metadata.name}')
API_POD=$(kubectl get pod -l app=r2s-api -o jsonpath='{.items[0].metadata.name}')

# Set up port forwarding to pod directly
echo "Setting up port forwarding from localhost:5432 to $DATABASE_POD:5432..."
kubectl port-forward $DATABASE_POD 5432:5432 &

echo "Setting up port forwarding from localhost:3000 to $API_POD:3000..."
kubectl port-forward $API_POD 3000:3000 &

echo "Port forwarding setup complete!"

