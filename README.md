# tfgridv3_collators

This repository contains terraform code to deploy a bunch of [substrate](https://substrate.io/) based collator nodes on top of the [Threefold Grid v3](https://new.threefold.io/)

## Repo layout

In the [src](src) directory you wil find 2 folders, [k8s_cluster](src/k8s_cluster) and [collators](src/collators).

You first need to deploy the k8s_cluster module. It is responsible to deploy a Kubernetes cluster on top a the Threefold grid. Before applying this module you need to create the proper tfvars file. Here is an example:

```terraform
k8s_network_ip_range = "10.0.0.0/16"

k8s_cluster_token            = "YTQ0YWE1NGU1Y2EwMzEzODVjNzU2OTcz"
k8s_cluster_sshkey           = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIIPTaB8O9KPcUlVmTuJjh8ccIoGTyo5c3d/t3TdBg3KA"
k8s_cluster_node_id_master   = 1          
k8s_cluster_node_ids_workers = [7, 11, 12]
k8s_cluster_master_cpu    = 2
k8s_cluster_worker_cpu    = 8
k8s_cluster_master_memory = 16384
k8s_cluster_worker_memory = 32768
k8s_cluster_master_disk   = 10
k8s_cluster_worker_disk   = 10
```

Once the cluster is deployed, retrieve the kubeconfig file from the master node and make it available for the [provider resource in the collators module](src/collators/main.tf).

Once the kubernetes provider is properly configure you can deploy the collators module.
