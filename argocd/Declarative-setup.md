<!-- https://argo-cd.readthedocs.io/en/stable/operator-manual/declarative-setup/ -->

# Declarative setup
<!-- https://argo-cd.readthedocs.io/en/stable/operator-manual/declarative-setup/#multiple-configuration-objects -->

1. Application setup
### Minimal

```yaml
apiVersion: argoproj.io/v1alpha1
kind: Application
metadata:
  name: guestbook
  namespace: argocd
spec:
  project: default
  source:
    repoURL: https://github.com/argoproj/argocd-example-apps.git
    targetRevision: HEAD
    path: guestbook
  destination:
    server: https://kubernetes.default.svc
    namespace: guestbook
```


Here,
1. `source` reference to the desired state in Git (repository, revision, path, environment)

2. `destination` reference to the target cluster and namespace. For the cluster one of server or name can be used, but not both (which will result in an error). Under the hood when the server is missing, it is calculated based on the name and used for any operations.


### Finalizer
it tell Kubernetes to wait until specific conditions are met before it fully deletes resources marked for deletion.
**ARGO CD** also provide finalizer.

```yaml
metadata:
  finalizers:
    - resources-finalizer.argocd.argoproj.io
```

## App of Apps

The "App of Apps" pattern in Argo CD allows you to manage multiple applications as a single application. This is particularly useful for managing complex deployments where you have multiple interdependent applications.

In this pattern, you create a parent Argo CD Application that references other Argo CD Applications as its children. This parent application can be used to deploy and manage all the child applications together.

Here is an simple example of how you can define a parent application that manages two child applications:

```yaml
apiVersion: argoproj.io/v1alpha1
kind: Application
metadata:
    name: parent-app
    namespace: argocd
spec:
    project: default
    source:
        repoURL: https://github.com/your-org/your-repo.git
        targetRevision: HEAD
        path: parent-app
    destination:
        server: https://kubernetes.default.svc
        namespace: argocd
    syncPolicy:
        automated:
            prune: true
            selfHeal: true
```

In the `parent-app` directory of your repository, you would have the following structure:

```
parent-app/
├── child-app-1.yaml
├── child-app-2.yaml
```

Each child application is defined as a separate YAML file:

```yaml
# child-app-1.yaml
apiVersion: argoproj.io/v1alpha1
kind: Application
metadata:
    name: child-app-1
    namespace: argocd
spec:
    project: default
    source:
        repoURL: https://github.com/your-org/your-repo.git
        targetRevision: HEAD
        path: child-app-1
    destination:
        server: https://kubernetes.default.svc
        namespace: child-app-1
```

```yaml
# child-app-2.yaml
apiVersion: argoproj.io/v1alpha1
kind: Application
metadata:
    name: child-app-2
    namespace: argocd
spec:
    project: default
    source:
        repoURL: https://github.com/your-org/your-repo.git
        targetRevision: HEAD
        path: child-app-2
    destination:
        server: https://kubernetes.default.svc
        namespace: child-app-2
```

### Graphical Representation

```
Parent Application
    |
    +--> Child Application 1
    |
    +--> Child Application 2
```