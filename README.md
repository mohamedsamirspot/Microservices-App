# Microservices Task

- The Infrastructure (terraform) Repo: https://github.com/mohamedsamirspot/Microservices-Infrastructure
- The Arogcd Manifests Repo: https://github.com/mohamedsamirspot/Microservices-K8s-Manifests


## Cicd (Gitlab-Ci or Github Actions)

This CICD Pipeline does the following:
- trivy-dependency-check
- owasp-dependency-check (optional)
- sonarqube-check
- build-and-trivy-scan-container-image
- push-container-image to GHCR
- package and push the Helm chart to GHCR for published builds
- promote the released chart version to dev in the GitOps repo and open a prod promotion PR for release tags
- Optional: build in multiarch (amd and arm)
![Image Description](screenshots/1.jpg)

## Release packaging

The app release artifact is composed of:
- Docker image: `ghcr.io/mohamedsamirspot/microservices-app:vX.Y.Z`
- Helm chart: `ghcr.io/mohamedsamirspot/microservices-app:X.Y.Z`

The Helm chart lives in `charts/microservices`. The release workflow packages it with `Chart.version=X.Y.Z` and `Chart.appVersion=vX.Y.Z`, so the chart deploys the matching image by default.

Manual branch publishing creates branch-suffixed image and chart versions without promotion. Release publishing updates the dev Argo CD Application directly and opens a prod promotion pull request in `mohamedsamirspot/Microservices-K8s-Manifests`.

The workflow expects a GitHub App installed on the GitOps repo, with these secrets configured in this repo:
- `GITOPS_APP_ID`
- `GITOPS_APP_PRIVATE_KEY`

The app needs `Contents: Read and write` and `Pull requests: Read and write` permissions on `mohamedsamirspot/Microservices-K8s-Manifests`.

### Gitlab
![Image Description](screenshots/2.png)
### Github Actions
![Image Description](screenshots/3.png)
### Dockerhub
![Image Description](screenshots/4.png)
### App
![Image Description](screenshots/5.png)
