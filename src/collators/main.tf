terraform {
  required_providers {
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "2.6.1"
    }
  }
}

provider "kubernetes" {
  config_path = "../k8s_cluster/configs/kubeconfig"
}


# module "karura" {
#   source = "./modules/collator"

#   namespace_name     = "karura"
#   collator_name      = "karura"
#   storage_size       = "500"
#   image              = "acala/karura-node:1.6.0"
#   args               = ["--chain=karura", "--execution=wasm", "--pruning=archive", "--collator", "--name=zaibon"]
#   storage_mountpoint = "/acala/data"
# }


module "moonriver" {
  source = "./modules/collator"

  namespace_name = "moonriver"
  collator_name  = "moonriver"
  storage_size   = "500"
  image          = "purestake/moonbeam:v0.15"
  args = [
    "--base-path=/data",
    "--chain=moonriver",
    "--name='zaibon'",
    "--validator",
    "--execution=wasm",
    "--wasm-execution=compiled",
    "--pruning=archive",
    "--state-cache-size=1",
    "--",
    "--pruning=archive",
    "--name='zaibon (Embedded Relay)'"
  ]
  storage_mountpoint = "/data"
  ports = [
    { container_port = 30333, protocol = "TCP" },
    { container_port = 30334, protocol = "TCP" },
    { container_port = 9933, protocol = "TCP" },
    { container_port = 9944, protocol = "TCP" },
  ]
}
