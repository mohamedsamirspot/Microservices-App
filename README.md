# Microservices Task

Note: 
- The Arogcd Manifests Repo: https://gitlab.com/microservices6813119/microservices-k8s-manifests
- The Infrastructure (terraform) Repo: https://gitlab.com/microservices6813119/microservices-infrastructure


## Applying K8s Manifests

These kubernetes manifests will create the following:
- Deployment (for the app)
- Load Balancer Service
- the required gitlab kubeconfig for rolling out deployments (service account, clusterrole, clusterrolebinding, secret token)
- eks cluster with karpenter (optional usage)
```bash
kubectl apply -f ./k8s-manifests/.
```
![Image Description](screenshots/3.png)
## Configuring Gitlab CI/CD Part

- Creating the image repo in dockerhub
- Connecting our cluster with our argocd for gitops https://gitlab.com/microservices6813119/microservices-k8s-manifests
![Image Description](screenshots/4.png)