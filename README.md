Step1: changing access permissions
  Run: chmod +x ./setup.sh \\
       chmod +x ./forward.sh

Step2: Run sh file \\
  Run: ./setup.sh \\  
       ./forward.sh

NOTE:
  - kind create cluster --config kind-config.yaml --name k8s => start cluster
  - kubectl apply -f database.yml => apply deployment for service
  - kubectl get pods -l app=postgres => get pods
  - kubectl describe pod postgres-6f8db687d4-nxsbs => check log
  - kubectl port-forward postgres-6f8db687d4-nxsbs 5432:5432 => forward port to connect 
  - kubectl rollout restart deployment r2s-api => restart
  - kind delete clusters --all  => delete all