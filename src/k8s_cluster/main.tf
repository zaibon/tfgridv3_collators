terraform {
  required_providers {
    grid = {
      source  = "threefoldtech/grid"
      version = "0.1.15"
    }
  }
}

provider "grid" {
  mnemonics = "thank toilet false humor expect pet oppose dial hundred race artefact primary"
  network   = "test" # or test to use testnet
}

resource "grid_network" "k8s_cluster_collators" {
  nodes         = setunion([var.k8s_cluster_node_id_master], var.k8s_cluster_node_ids_workers)
  ip_range      = var.k8s_network_ip_range
  name          = "k8s_cluster_collators"
  description   = "Network used for the k8s cluster runnings polkadot collators"
  add_wg_access = true

}

resource "grid_kubernetes" "k8s_cluster_collators" {
  network_name   = grid_network.k8s_cluster_collators.name
  nodes_ip_range = grid_network.k8s_cluster_collators.nodes_ip_range
  token          = var.k8s_cluster_token
  ssh_key        = var.k8s_cluster_sshkey

  master {
    disk_size = var.k8s_cluster_master_disk
    node      = var.k8s_cluster_node_id_master
    name      = "master"
    cpu       = var.k8s_cluster_master_cpu
    memory    = var.k8s_cluster_master_memory
    # publicip  = true
    publicip = false
  }

  dynamic "workers" {
    for_each = var.k8s_cluster_node_ids_workers
    content {
      disk_size = var.k8s_cluster_worker_disk
      node      = workers.value
      name      = "worker${workers.key}"
      cpu       = var.k8s_cluster_worker_cpu
      memory    = var.k8s_cluster_worker_memory
    }
  }
}
