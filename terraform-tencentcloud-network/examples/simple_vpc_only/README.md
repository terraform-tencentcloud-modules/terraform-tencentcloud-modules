# Simple VPC Only

This example configures a simple VPC without any other resources.

If an existing vpc_id is passed in, a new VPC won't be created. Instead, all other resources will be created into the existing VPC. 

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| region | The region of the network being created | `string` | na-siliconvalley | yes |

## Outputs

| Name | Description |
|------|-------------|
| vpc\_id | The ID of the VPC being created |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
