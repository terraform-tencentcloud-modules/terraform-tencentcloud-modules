# Subnets Only

This example configures subnet(s) in an existing VPC. 

The [subnet attributes](https://registry.terraform.io/providers/tencentcloudstack/tencentcloud/latest/docs/resources/subnet#argument-reference) for each subnet are input as name/value entries in a map. 

The subnet attribute will take route_table_id for custom route table. If no `route_table_id` but `route_table_name` passed instead in the map, the module will look for a map of name-id for custom route table(s). 

If there is no route table information specified for the subnet, subnet will use the default route table of the VPC.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| region | The region of the network being created | `string` | na-siliconvalley | yes |
| vpc\_id | The ID of existing VPC to create subnet(s) in |
 

## Outputs

| Name | Description |
|------|-------------|
| vpc\_id | The ID of the VPC being created |
| subnets\_names | The list of names for the subnets being created |
| subnets\_ids | The list of IDS for the subnets being created |
| subnets\_ips | The list of CIDRs for the subnets being created |
| subnets\_azs | The list of Availability Zones for the subnets being created |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
