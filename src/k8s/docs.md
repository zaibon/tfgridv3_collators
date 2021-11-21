<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_grid"></a> [grid](#requirement\_grid) | 0.1.15 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_grid"></a> [grid](#provider\_grid) | 0.1.15 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [grid_kubernetes.k8s_cluster_collators](https://registry.terraform.io/providers/threefoldtech/grid/0.1.15/docs/resources/kubernetes) | resource |
| [grid_network.k8s_cluster_collators](https://registry.terraform.io/providers/threefoldtech/grid/0.1.15/docs/resources/network) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_k8s_cluster_master_cpu"></a> [k8s\_cluster\_master\_cpu](#input\_k8s\_cluster\_master\_cpu) | Amount of cpu to allocate to the master node | `number` | n/a | yes |
| <a name="input_k8s_cluster_master_disk"></a> [k8s\_cluster\_master\_disk](#input\_k8s\_cluster\_master\_disk) | Amount of disk to allocate to the master node, in GiB | `number` | n/a | yes |
| <a name="input_k8s_cluster_master_memory"></a> [k8s\_cluster\_master\_memory](#input\_k8s\_cluster\_master\_memory) | Amount of memory to allocate to the master node, in MiB | `number` | n/a | yes |
| <a name="input_k8s_cluster_node_id_master"></a> [k8s\_cluster\_node\_id\_master](#input\_k8s\_cluster\_node\_id\_master) | Node id of the k8s master | `number` | n/a | yes |
| <a name="input_k8s_cluster_node_ids_workers"></a> [k8s\_cluster\_node\_ids\_workers](#input\_k8s\_cluster\_node\_ids\_workers) | Node ids of the k8s worker nodes | `list(number)` | n/a | yes |
| <a name="input_k8s_cluster_sshkey"></a> [k8s\_cluster\_sshkey](#input\_k8s\_cluster\_sshkey) | public SSH key to authorize on all the cluster nodes | `string` | n/a | yes |
| <a name="input_k8s_cluster_token"></a> [k8s\_cluster\_token](#input\_k8s\_cluster\_token) | token used by all k8s cluster nodes to authorize each other | `string` | n/a | yes |
| <a name="input_k8s_cluster_worker_cpu"></a> [k8s\_cluster\_worker\_cpu](#input\_k8s\_cluster\_worker\_cpu) | Amount of cpu to allocate to the worker nodes | `number` | n/a | yes |
| <a name="input_k8s_cluster_worker_disk"></a> [k8s\_cluster\_worker\_disk](#input\_k8s\_cluster\_worker\_disk) | Amount of disk to allocate to the worker nodes, in GiB | `number` | n/a | yes |
| <a name="input_k8s_cluster_worker_memory"></a> [k8s\_cluster\_worker\_memory](#input\_k8s\_cluster\_worker\_memory) | Amount of memory to allocate to the worker nodes, in MiB | `number` | n/a | yes |
| <a name="input_k8s_network_ip_range"></a> [k8s\_network\_ip\_range](#input\_k8s\_network\_ip\_range) | IP range of the network used by the k8s cluster | `string` | `"10.0.0.0/16"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_k8s_cluster"></a> [k8s\_cluster](#output\_k8s\_cluster) | n/a |
| <a name="output_network"></a> [network](#output\_network) | n/a |
<!-- END_TF_DOCS -->