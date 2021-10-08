By default when we do not specify any scale options, only one instance of the application pod gets deployed.

If the application pod instance dies for some reason, Kubernetes will bring it back automatically.

Lets, kill the pod we just deployed and check the status
```execute
kubectl delete pod --wait=false $(kubectl get pods | grep tce-swag  | awk '{print $1}' )
```
You will see a message saying the Pod is deleted, notice the name of the pod in the message.
List the pods again.

```execute
kubectl get deployments,pods
```

You will notice that Kubernetes has immediately replaced the pod with a new one.
This is done because our Deployment declares that there should always be one running replica.

Unless the deployment is deleted, app pods will always be created to satisfy the count that was specified.

### Let's scale the application

Scaling an application is very simple. You don't need to think about how many to add or remove.
Instead, you specify the number of instances you want for the Deployment, and Kubernetes will automatically scale the app to the desired state.

Currently, the tce-swag application only has one instance, let's scale the app to have 3 instances.
```execute
kubectl scale deployment/tce-swag --replicas=3
```
This will update the Deployment and scale to 3 pods.
Let's confirm

```execute
kubectl get deployments,pods
```

Finally, let's order our swag!

