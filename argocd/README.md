# Argo CD

## Installation
```shell=
kubectl create namespace argocd
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml
```

### By default, the Argo CD API server is not exposed with an external IP, To access the API server:

1. Change the service type to load balancer

```shell=
kubectl patch svc argocd-server -n argocd -p '{"spec": {"type": "LoadBalancer"}}'
```

2. Port forward

```shell=
kubectl port-forward svc/argocd-server -n argocd 8080:443
```

### Login CLI

```shell=
argocd admin initial-password -n argocd
```

```shell=
argocd login <ARGOCD_SERVER>
```

## Declarative way
Read this file for installing.
[Declarative way installation](Declarative-setup.md)


## Argo Helm Chart
Go to this link: https://argoproj.github.io/argo-helm/
Artifact link: https://artifacthub.io/packages/helm/argo/argo-cd

[Exercise](argocd/README.md)