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

```dashboard:create-dashboard
name: Grafana
url: https://grafana.tanzu-dev.com
```

Log on to the dashbaod with username/password as `admin/admin`

Go to the Dashbaord `Petclinic`

You will see Promethues already scrapping metrics from your application as well as the underlying Kubernetes Infrastructure.

