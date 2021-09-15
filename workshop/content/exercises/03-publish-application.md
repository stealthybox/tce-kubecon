By Default all Application Pods that get created do not allow external traffic or traffic from other Application Pods.

In order to receive traffic we need to publish the app to have a service. Let's create a Load Balancing service for petclinic application. This will allow external traffic to the application.

Publish Petclinic using a service call `petclinic-service`

```execute
kubectl expose deployment/petclinic --port 80 --target-port 8080 --type=LoadBalancer

```

Listing Kubernetes Services will show the External IP/URL for the application

```execute
kubectl get svc
```

Look for the External address against the `Service` : `Petclinic`. CLick the URL , it will take you to the Application home page.

It may take a minute or two to get the URL Routed.

Congratulations! You just deployed a micro-service!
