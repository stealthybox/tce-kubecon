Tanzu Community Edition provides a way to deploy additional Packages to the Kubernetes Cluster.

The terminal environement on the right hand side has the Kubernetes CLI authenticated against the Tanzu Community Edition Cluster

```execute
kubectl cluster-info
```

There is a well-maintained repository that makes several components available.
To take a look at the packages that can be configured, installed, and updated, run this command:

```execute
tanzu package available list 
```

We can install Promethues and Grafana by simply selecting the version from the available packages list. 

# Install Prometheus & Grafana

For our platform we need Promethues and Grafana.

Prometheus is a tool that can ingest application metrics and store them in a time series database.
Grafana lets us visualize metrics that Prometheus gathers in our own custom dashboards.

Our cluster admin has already installed these packages for us using the Tanzu CLI.
Let's show which packages are installed:

```execute
tanzu package installed list
```

Below are the commands our cluster admin used to install those packages for us:
**Note: These are made non-executable on purpose as the Kubernetes Cluster is shared. Re-running them commands will show a message that they are already installed. **
```
tanzu package install prometheus --package-name prometheus.community.tanzu.vmware.com --version 2.27.0 
```
```
tanzu package install grafana --package-name grafana.community.tanzu.vmware.com --version 7.5.7 --values-file grafana-tce.yaml 
```

We can also verify this by looking at the Deployments and Pods in the Cluster

```execute
kubectl get deployments,pods -n prometheus
kubectl get deployments,pods -n grafana
```
