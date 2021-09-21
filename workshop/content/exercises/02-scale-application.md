We just deployed a containerized application, by default when we do not specify any scale options, only one instance of the application pod gets deployed.

If the application pod instance dies for some reason, Kubernetes will bring it back automatically.

Lets, kill the pod we just deployed and check the status
```execute
kubectl delete pod $(kubectl get pods | grep petclinic  | awk '{print $1}' )
```
You will see a message saying the Pod is deleted, notice the name of the pod in the message.

Now, let's look at the pods still running

```execute
kubectl get pods
```
You will notice a new pod has spun up with a different name for Petclinic. 

Unless the deployment is deleted, application pods will automatically re-spin to the count that was specified.

### Let's scale the application

Scaling an application is very simple, you specify the no. of instances you want for a Deployment, Kubernetes will automatically scale the apps to the desired state.

Currently, the petclinic application only has one instance, let's scale the app to have 3 instances. When we deployed petclinic in the earlier lesson, Kubernetes automatically created a Replica Set that sets the no. of Pods for this application to be 1 ( since we did not specify a count). 
```execute
kubectl scale deployment/petclinic-{{session_namespace}} --replicas=3
```
This will scale the pods for petclinic to a count of 3. Let's confirm by listing pods

```execute
kubectl get pods
```
You should see three pods for the petclinic application.


