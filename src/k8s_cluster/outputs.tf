output "k8s_cluster" {
  value = {
    "master" : grid_kubernetes.k8s_cluster_collators.master[0],
    "worker0" : grid_kubernetes.k8s_cluster_collators.workers[0],
    "worker1" : grid_kubernetes.k8s_cluster_collators.workers[1],
    "worker2" : grid_kubernetes.k8s_cluster_collators.workers[2],
  }
}

output "network" {
  value = {
    "access_wg_config"    = grid_network.k8s_cluster_collators.access_wg_config
    "external_ip"         = grid_network.k8s_cluster_collators.external_ip
    "external_sk"         = grid_network.k8s_cluster_collators.external_sk
    "node_deployment_id " = grid_network.k8s_cluster_collators.node_deployment_id
    "public_node_id "     = grid_network.k8s_cluster_collators.public_node_id
  }
}
