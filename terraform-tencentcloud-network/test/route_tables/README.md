# Custom Route Tables Module Test

This snippet tests the route_tables module by configuring custom route tables in an existing VPC. 

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| region | The region of the network being created | `string` | na-siliconvalley | yes |
| vpc\_id | The ID of the VPC for the network | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| custom\_route\_tables | The list of all created custom route tables. |
| custom\_route\_tables\_name\_id | The name-id map of created custom route tables. |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
