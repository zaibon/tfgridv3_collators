<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_kubernetes"></a> [kubernetes](#provider\_kubernetes) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [kubernetes_deployment.collator](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/deployment) | resource |
| [kubernetes_namespace.collator](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/namespace) | resource |
| [kubernetes_persistent_volume_claim.collator_data](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/persistent_volume_claim) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_args"></a> [args](#input\_args) | Argument to pass to the collator pod | `list(string)` | n/a | yes |
| <a name="input_collator_name"></a> [collator\_name](#input\_collator\_name) | Name of the collator node | `string` | n/a | yes |
| <a name="input_image"></a> [image](#input\_image) | Image name to use for the collartor pod | `string` | n/a | yes |
| <a name="input_namespace_name"></a> [namespace\_name](#input\_namespace\_name) | Name of the K8S namespace where to deploy the collator | `string` | n/a | yes |
| <a name="input_ports"></a> [ports](#input\_ports) | List of port forwarding configuration | <pre>list(object({<br>    container_port = number<br>    protocol       = string<br>  }))</pre> | n/a | yes |
| <a name="input_storage_mountpoint"></a> [storage\_mountpoint](#input\_storage\_mountpoint) | Path where to the mount the persistan volume claim into the collator pod | `string` | n/a | yes |
| <a name="input_storage_size"></a> [storage\_size](#input\_storage\_size) | Size of the persistant volume claim to mount into the collator pod | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->