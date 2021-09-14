The terminal environement on the right hand side has the Kubernetes CLI authenticated against the Tanzu Community Edition Cluster

```execute
kubectl cluster-info
```

Currently, there are no many applications deployed. Let's take a look at the current application running.

You can wither look at the running applications using `Kubectl` CLI or check the `Console` tab on the right hand side to view Applications

```execute
kubectl get pods
```

To view in the User Interface (UI), Click on the Console tab  on the Right Hand side,-->Select  Workloads from the left hand panel --> click on Deployments.

```dashboard:open-dashboard
name: Console
```
