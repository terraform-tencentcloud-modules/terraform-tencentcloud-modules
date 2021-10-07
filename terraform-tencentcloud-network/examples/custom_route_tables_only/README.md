# Custom Route Tables Only

This example configures custom route tables in an existing VPC simple VPC.

This VPC doesn't have to contain subnet(s). The created route tables can be associated to subnet(s) later via route table ID. 

The [route table attributes](https://registry.terraform.io/providers/tencentcloudstack/tencentcloud/latest/docs/resources/route_table#argument-reference) for each route table are input as name/value entries in a map. 
  
<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| region | The region of the network being created | `string` | na-siliconvalley | yes |
| vpc\_id | The ID of the VPC for the network | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| custom\_route\_table\_names | The list of names for the route tables being created |
| custom\_route\_table\_ids | The list of IDs for the route tables being created |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
