variable "k8s_network_ip_range" {
  type        = string
  description = "IP range of the network used by the k8s cluster"
  default = "10.0.0.0/16"
}

variable "k8s_cluster_token" {
  type        = string
  sensitive   = true
  description = "token used by all k8s cluster nodes to authorize each other"
}

variable "k8s_cluster_sshkey" {
  type        = string
  description = "public SSH key to authorize on all the cluster nodes"
}

variable "k8s_cluster_node_id_master" {
  type        = number
  description = "Node id of the k8s master"
}

variable "k8s_cluster_node_ids_workers" {
  type        = list(number)
  description = "Node ids of the k8s worker nodes"
}

variable "k8s_cluster_master_memory" {
  type        = number
  description = "Amount of memory to allocate to the master node, in MiB"
}

variable "k8s_cluster_worker_memory" {
  type        = number
  description = "Amount of memory to allocate to the worker nodes, in MiB"
}

variable "k8s_cluster_master_cpu" {
  type        = number
  description = "Amount of cpu to allocate to the master node"
}

variable "k8s_cluster_worker_cpu" {
  type        = number
  description = "Amount of cpu to allocate to the worker nodes"
}

variable "k8s_cluster_master_disk" {
  type        = number
  description = "Amount of disk to allocate to the master node, in GiB"
}

variable "k8s_cluster_worker_disk" {
  type        = number
  description = "Amount of disk to allocate to the worker nodes, in GiB"
}
