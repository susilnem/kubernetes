## Prerequisites
```bash
minikube version
```

Helm Installed: Ensure Helm is installed.
```bash
helm version
```

kubectl Installed: Ensure kubectl is installed and configured to interact with Minikube.
```bash
kubectl version
```

### Step 1: Start a Minikube cluster if it's not already running:
```shell
minikube start
```


### Step 2: Add Argo CD Helm Repository
Add the Argo CD Helm repository to your Helm client:

```bash
helm repo add argo https://argoproj.github.io/argo-helm
```

### Step 3: Install Argo CD using Helm:
Install Argo CD in the argocd namespace

```bash
helm install argocd argo/argo-cd --namespace argocd --create-namespace
```


## Install using helmfile plugin

1. Install helmfile

```shell
yay -s helmfile
```

2. initialize helmfile

```shell
helmfile -f argocd/install.yaml sync
```

3. Portforward argocd  

```shell
kubectl port-forward service/argocd-server -n argocd 8080:44
```

4. Access in browser -> Go to :http://localhost:8080


5. Credentials

    **username** - admin

    for **password**, type this command:

    ```shell
    kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d
    ```