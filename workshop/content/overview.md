Tanzu Community Edition enables the creation of modern application platforms. These platforms can be created on local laptops or various cloud and Infrastructure options. A platform deployed using tanzu Community edition provides a Kubernetes Run time, Tooling and additional repository of packages that can be installed/updated very easily.

![Tanzu Community Edition](images/tce-intro.png)

Tanzu Community Edition is a freely available, Community supported Tanzu Platform. The Platform itself consists of various Open Source Software (OSS) to enable various functions.
![Tanzu Community Edition Architecture](images/tce-architecture.png)

Users can leverage **Tanzu CLI** to create a Kubernetes Cluster and add additional tooling to build and Deploy Modern Apps efficiently.

### What you will do in the lab

* Familiarize with Tanzu CLI
* Deploy Modern Apps
* Scale Applications
* Build Micro-services
  
Tanzu Community Edition is already deployed and running on the environment.
To see various options execute below

```execute
tanzu
```

You will notice the options to install packages, check for Kubernetes Conformance, install management and Standalone CLusters etc.

Within Tanzu Community edition, there are two methods to building Kubernetes Centric platforms. 

* **Management + Workload Clusters** : This method involves provisioning a management Kubernetes Cluster and using that cluster to build more Kubernetes workload Clusters. The management cluster helps in providing/storing authentication details of workload clusters.
* **Standalone Clusters** : These are Kubernetes clusters built without a management cluster directly on the infrastructure provide of choice. Once the Standalone Cluster is built, storing and retrieving access to the Kubernetes cluster is deferred to the admin of the cluster.

The current environment has a Standalone cluster already pre-deployed to save time. 