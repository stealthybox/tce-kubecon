

Cloud Native Runtimes Workshop for Tanzu Developer Portal

For more detailed information on how to create and deploy workshops, consult
the documentation for Educates at:

* https://docs.edukates.io

If you already have the Educates operator installed and configured, to
deploy and view this sample workshop, run:

```
kubectl apply -f https://raw.githubusercontent.com/stealthybox/tce-kubecon/main/resources/workshop.yaml
kubectl apply -f https://raw.githubusercontent.com/stealthybox/tce-kubecon/main/resources/training-portal.yaml
```

This will deploy a training portal hosting just this workshop. To get the
URL for accessing the training portal run:

```
kubectl get trainingportal/tce-kubecon
```


