Now let's use our tce-swag app to order a shipment of swag to us!

By default Pods are not reachable via the internet.

In order to receive traffic on the tce-swag store we need to publish the app with a Service.
Let's create a Service of type "LoadBalancer" which will allow external traffic from the internet to reach the store.

```execute
kubectl expose deployment/tce-swag --port 80 --target-port http --type=LoadBalancer
```

Tanzu Community Edition already includes the necessary software components to serve this platform need.
In this case the LoadBalancer is fulfilled by the AWS Cloud Provider creating an ELB, but we did not need to do anything AWS specific to make this happen.

Getting the Kubernetes Services will show the External IP/URL.

```execute
kubectl get services
```

Check that the `EXTERNAL-IP` column of the `tce-swag` service gets a value.

Print the link with the below command to visit the store's `/swag/` endpoint -- your **unique code** will be at the top of the page!
It may take a minute or two for the URL to resolve via the internet's DNS servers.

```execute
kubectl get service tce-swag --no-headers | awk '{print "https://" $4 "/swag/"}'
```

Congratulations!  
Input your *e-mail* and *access-code* to order your choice of swag -- it's well earned.
