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

Print the link with the below command to get your **unique code**.
It may take a minute or two for the URL to resolve via the internet's DNS servers.

```execute
kubectl get service tce-swag --no-headers | awk '{print "http://" $4}'
```

Congratulations!  
Click "Copy 📋", then "Order Swag" and input your *e-mail* and *access-code* to start your order -- it's well earned.
