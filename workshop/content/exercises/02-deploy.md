Now that we have our platform, we can deploy and monitor our applications.
We'll use the `kapp` CLI to deploy and keep track of our app.

You can either look at the running application workloads using the `kubectl` CLI or check the `Console` tab on the right hand side to view Applications.

```execute
kubectl get pods
```

To view the Console user interface, navigate to the Console tab on the right-hand side,  
select "Workloads" from the left hand panel, then select "Deployments".

```dashboard:open-dashboard
name: Console
```

There's not much here yet.  
Let's deploy our application with `kapp`.  

```execute
kapp deploy --app tce-swag --yes -f tce-swag-deploy.yaml
```

`kapp deploy` improves `kubectl apply` in a few ways.
You'll notice that it waits for our resources to become ready before it exits.
While it's waiting, it tells us about what's happening to them.

Our app also groups our resources under a single app-name.

```execute
kapp list
```

We can view all of the resources specific to our app and see a unified log stream of all its pieces.

```execute
kapp inspect --app tce-swag
```

```execute
kapp logs --app tce-swag
```

`kapp` also makes it easy to update our app and delete it cleanly without destroying anyone else's work.


Normal `kubectl` commands still show us these resources as well

```execute
kubectl get deployments,pods
```

Our app hosts an online store where we can order our Tanzu Community Edition swag!
Below is the config for the tce-swag Deployment.
Notice that it annotates that it should be scraped by Prometheus on port `9113`.

```yaml
---
apiVersion: apps/v1
kind: Deployment
metadata:
  name: tce-swag
  labels:
    app: tce-swag
spec:
  replicas: 1
  selector:
    matchLabels:
      app: tce-swag
  template:
    metadata:
      labels:
        app: tce-swag
      annotations:
        prometheus.io/scrape: "true"
        prometheus.io/port: "9113"
    spec:
      containers:
        - name: tce-swag
          image: ghcr.io/stealthybox/tce-swag:latest
          imagePullPolicy: "IfNotPresent"
          ports:
            - name: http
              containerPort: 80
            - name: status
              containerPort: 8080
          volumeMounts:
          - name: code
            mountPath: /usr/share/nginx/html/code/
        - name: metrics
          image: nginx/nginx-prometheus-exporter:0.9.0
          imagePullPolicy: "IfNotPresent"
          args:
            - -nginx.scrape-uri
            - http://127.0.0.1:8080/nginx_status
          ports:
            - name: metrics
              containerPort: 9113
      volumes:
        - name: code
          configMap:
            name: code
      automountServiceAccountToken: false
      shareProcessNamespace: false
      serviceAccountName: default
```

Using `kapp` you deployed our containerized app in an organized way atop our Tanzu Community Edition platform.

Next, let's look at using the platform our cluster admin configured to monitor it.
