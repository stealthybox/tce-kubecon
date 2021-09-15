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

Let's deploy a spring based application. This is an application that has a directory of clinics/veterinarians to look up for pets.

```execute
kubectl create deployment petclinic --image ghcr.io/boskey/petclinic
```

Notice the pods deployed withe the above command

```execute
kubectl get pods
```

Wait a few minutes if the status is not running and re-run the command above. You will notice the application has been deployed and is running.

You just deployed a containerized application effortlessly without needing to understand the hardware the platform is running on!

Next, lets scale the application. Click **Continue**. 