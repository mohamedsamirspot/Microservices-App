# Microservices Task

- The Infrastructure (terraform) Repo: https://github.com/mohamedsamirspot/Microservices-Infrastructure
- The Arogcd Manifests Repo: https://github.com/mohamedsamirspot/Microservices-K8s-Manifests


## Cicd (Gitlab-Ci or Github Actions)

This CICD Pipeline does the following:
- trivy-dependency-check
- owasp-dependency-check (optional)
- sonarqube-check
- build-container-image
- trivy-container-scan
- push-container-image to docker hub

### Gitlab
![Image Description](screenshots/1.png)
### Github Actions
![Image Description](screenshots/2.png)
### Dockerhub
![Image Description](screenshots/3.png)
### App
![Image Description](screenshots/4.png)