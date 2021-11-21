resource "kubernetes_namespace" "collator" {
  metadata {
    name = var.namespace_name
  }
}

resource "kubernetes_persistent_volume_claim" "collator_data" {
  metadata {
    name      = var.collator_name
    namespace = kubernetes_namespace.collator.metadata.0.name
  }
  spec {
    access_modes = ["ReadWriteOnce"]
    resources {
      requests = {
        storage = var.storage_size
      }
    }
  }
}

resource "kubernetes_deployment" "collator" {
  metadata {
    name      = var.collator_name
    namespace = kubernetes_namespace.collator.metadata.0.name
  }
  spec {
    replicas = 1
    selector {
      match_labels = {
        app = var.collator_name
      }
    }
    template {
      metadata {
        labels = {
          app = var.collator_name
        }
      }
      spec {
        container {
          image = var.image
          name  = "${var.collator_name}-node"
          args  = var.args

          dynamic "port" {
            for_each = var.ports
            content {
              container_port = port.value.container_port
            }
          }

          volume_mount {
            mount_path = var.storage_mountpoint
            name       = "data"
            read_only  = false
          }
        }

        volume {
          name = "data"
          persistent_volume_claim {
            # FIXME: we should depend on the kubernetes_persistent_volume_claim.karura
            #  but the storageclass is WaitForFirstConsumer so we need to create both concurrently for this to work
            claim_name = var.collator_name # "karura"
            read_only  = false
          }
        }
      }
    }
  }
}
