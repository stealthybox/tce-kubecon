Let's monitor the Application we deployed using Prometheus and Grafana

Promethues- Is a tool that can ingest application metrics and store them in a time series database.
Grafana- lets us visualize metrics that Prometheus gathers

Tanzu Community Edition provides a way to deploy additional Packages that can be deployed on the Kubernetes Cluster. In this case since we need Promethues and Grafana, we use Tanzu CLI to easily install them.

Tanzu Community edition had a repository of packages that can be installed/updated/configured. 

To take a look at the packages that can be installed run:

```execute
tanzu package available list 
```

We can install Promethues and Grafana by simply selecting the version from the available packages list. 

# Install Prometheus & Grafana

Below commands will install Prometheus and Grafana on the cluster.
**Note: These are made non-executable on purpose as the Kubernetes Cluster is shared. Re-running the below commands will show a message that they are already configured or installed. **

```
tanzu package install prometheus --package-name prometheus.community.tanzu.vmware.com --version 2.27.0 
```
```
tanzu package install grafana --package-name grafana.community.tanzu.vmware.com --version 7.5.7 --values-file grafana-tce.yaml 
```

This will install Prometheus and Grafana, take a look at the Packages installed.

```execute
tanzu package installed list
```
We can also verify this by looking at the Pods in the Clusters

```execute
kubectl get pods -n prometheus
kubectl get pods -n grafana
```

Let's logon to Grafana and look at the metrics from the application `Petcilinic` that we deployed in Exercise-1

Let's get the service URL for Grafana Dashboard.

```execute
kubectl get svc -n grafana | awk '{print $4}'
```
Copy the URL and paste it in a new browser tab. The user name to logon to is `tce` and password is `TCEuser@Grafana`


Go to the Dashbaord `JVM(Micrometer)`

You will see Promethues already scrapping metrics from your application.

