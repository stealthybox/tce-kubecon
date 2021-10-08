VMware Tanzu Community Edition is a full-featured, easy to manage Kubernetes platform for learners and users. It is a freely available, community supported, open source distribution of VMware Tanzu that can be installed and configured in minutes on your local workstation or your favorite cloud.

![Tanzu Community Edition](images/tce-intro.png)

It includes a package repository for installing and updating components of your platform.
![Tanzu Community Edition Architecture](images/tce-architecture.png)

Users can leverage **Tanzu CLI** to create a Kubernetes Cluster and add additional tooling to build and Deploy Modern Apps efficiently.

### What you will do in the lab

- Get familiar with the `tanzu` CLI
- List packages
- Deploy an app with `kapp`
- Monitor the app
- Scale the app
- Order swag

Tanzu Community Edition is already deployed and running on the environment.
To see various options execute below

```execute
tanzu
```

You will notice the options to install packages, check for Kubernetes Conformance, install management and Standalone CLusters etc.

Within Tanzu Community edition, there are two methods to building Kubernetes centric platforms. 

* **Management + Workload Clusters** : This method involves provisioning a management Kubernetes Cluster and using that cluster to build more Kubernetes workload Clusters. The management cluster helps in providing/storing authentication details of workload clusters via Cluster API.
* **Standalone Clusters** : These are Kubernetes clusters built without a management cluster directly on the infrastructure provide of choice. Once the Standalone Cluster is built, storing and retrieving access to the Kubernetes cluster is deferred to the admin of the cluster.

The current environment has a Standalone cluster already pre-deployed to save time. 