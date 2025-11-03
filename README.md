# Microservices Task

Note:
- The Infrastructure (terraform) Repo: https://github.com/mohamedsamirspot/Microservices-Infrastructure
- The Arogcd Manifests Repo: https://github.com/mohamedsamirspot/Microservices-K8s-Manifests


## Cicd

This CICD Pipeline does the following:
- trivy-dependency-check
- owasp-dependency-check (optional)
- sonarqube-check
- build-container-image
- trivy-container-scan
- push-container-image to docker hub

![Image Description](screenshots/3.png)
![Image Description](screenshots/4.png)