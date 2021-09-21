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
cat << EOF | kubectl apply -f -
apiVersion: apps/v1
kind: Deployment
metadata:
  name: petclinic-{{session_namespace}}
spec:
  selector:
    matchLabels:
      app: petclinic
  replicas: 1
  template:
    metadata:
      labels:
        app: petclinic
      annotations:
        prometheus.io/scrape: "true"
        prometheus.io/port: "8080"
        prometheus.io/path: "/actuator/prometheus"
    spec:
      containers:
        - name: petclinic
          image: ghcr.io/boskey/petclinic:latest
          imagePullPolicy: Always
          ports:
            - containerPort: 8080
          resources:
            limits:
              memory: 294Mi
EOF
```

Notice the pods deployed withe the above command

```execute
kubectl get pods
```

Wait a few minutes if the status is not running and re-run the command above. You will notice the application has been deployed and is running.

You just deployed a containerized application effortlessly without needing to understand the hardware the platform is running on!

Next, lets scale the application. Click **Continue**. 