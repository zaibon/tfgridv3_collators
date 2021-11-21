variable "namespace_name" {
  type        = string
  description = "Name of the K8S namespace where to deploy the collator"
}
variable "collator_name" {
  type        = string
  description = "Name of the collator node"
}
variable "storage_size" {
  type        = string
  description = "Size of the persistant volume claim to mount into the collator pod"
}

variable "image" {
  type        = string
  description = "Image name to use for the collartor pod"
}
variable "args" {
  type        = list(string)
  description = "Argument to pass to the collator pod"
}
variable "storage_mountpoint" {
  type        = string
  description = "Path where to the mount the persistan volume claim into the collator pod"
}

variable "ports" {
  type = list(object({
    container_port = number
    protocol       = string
  }))
  description = "List of port forwarding configuration"
}
