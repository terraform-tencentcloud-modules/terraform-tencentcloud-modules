# Route Entry Module Test

This snippet tests adding custom route entries into an existing custom route table.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| region | The region of the network being created | `string` | na-siliconvalley | yes |
| custom\_route\_tables | The name-id map of existing route tables | `map` | n/a | no |
| route\_entries | The list of attributes for route entries | `map(string)` | n/a | no |

## Outputs

| Name | Description |
|------|-------------|
| route\_entries | The list of all created custom route entries. |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
