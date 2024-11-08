# Simple MongoDB Setup with Kubernetes

## Prerequisites
- [Minikube](https://minikube.sigs.k8s.io/docs/start/)
- [Docker](https://docs.docker.com/desktop/install/linux/)
- [Kubectl](https://kubernetes.io/docs/tasks/tools/)

## Quick Start

1. Start your cluster:
```bash
minikube start
```

2. Deploy your applications:
```bash
# Apply MongoDB credentials
kubectl apply -f secret.yaml

# Apply MongoDB configuration
kubectl apply -f mongo-configmap.yaml

# Deploy MongoDB
kubectl apply -f mongo-app.yaml

# Deploy MongoDB Express web interface
kubectl apply -f web-app.yml
```

## Check if everything is working

```bash
# Check your pods
kubectl get pods

# Check your services
kubectl get services
```

## Access MongoDB Express

To access the web interface:
```bash
minikube service web-app-service
```

## Clean Up

When you're done:
```bash
# Delete all resources
kubectl delete -f web-app.yml
kubectl delete -f mongo-app.yaml
kubectl delete -f mongo-configmap.yaml
kubectl delete -f secret.yaml

# Stop Minikube
minikube stop
```

## Troubleshooting

If something's not working:
```bash
# Check pod details
kubectl describe pod <pod-name>

# Check logs
kubectl logs <pod-name>
```