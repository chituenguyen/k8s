# Kubernetes Local Development Setup

## Prerequisites
- Docker
- Kind (Kubernetes in Docker)
- kubectl

## Setup Instructions

### Step 1: Set Execute Permissions
```bash
chmod +x ./setup.sh
chmod +x ./forward.sh
```

### Step 2: Run Setup Scripts
```bash
./setup.sh
./forward.sh
```

## Useful Commands

NOTE:
  - kind create cluster --config kind-config.yaml --name k8s => start cluster
  - kubectl apply -f database.yml => apply deployment for service
  - kubectl get pods -l app=postgres => get pods
  - kubectl describe pod postgres-6f8db687d4-nxsbs => check log
  - kubectl port-forward postgres-6f8db687d4-nxsbs 5432:5432 => forward port to connect 
  - kubectl rollout restart deployment r2s-api => restart
  - kind delete clusters --all  => delete all