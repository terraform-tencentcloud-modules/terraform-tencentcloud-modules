# Simple VPC With Custom Route Tables

This example configures a simple VPC with custom route table(s), subnet(s), and route entries.

- VPC

If an existing vpc_id is passed in, a new VPC won't be created. Instead, all other resources will be created into the existing VPC. 

- Subnet

The [subnet attributes](https://registry.terraform.io/providers/tencentcloudstack/tencentcloud/latest/docs/resources/subnet#argument-reference) for each subnet are input as name/value entries in a map. 

The subnet attribute will take route_table_id for custom route table. If no `route_table_id` but `route_table_name` passed instead in the map, the module will look for a map of name-id for custom route table(s). 

If there is no route table information specified for the subnet, subnet will use the default route table of the VPC.

- Route Table

The [route table attributes](https://registry.terraform.io/providers/tencentcloudstack/tencentcloud/latest/docs/resources/route_table#argument-reference) for each route table are input as name/value entries in a map. 

- Route Entry

The [attributes](https://registry.terraform.io/providers/tencentcloudstack/tencentcloud/latest/docs/resources/route_table_entry#argument-reference) for each route table entry are input as name/value entries in a map. 

The route entry attribute will take route_table_id for custom route table. If no `route_table_id` but `route_table_name` passed instead in the map, the module will look for a map of name-id for custom route table(s).


<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| region | The region of the network being created | `string` | na-siliconvalley | yes |

Please note that you can update the fields in main.tf for [VPC](https://registry.terraform.io/providers/tencentcloudstack/tencentcloud/latest/docs/resources/vpc) and [subnet](https://registry.terraform.io/providers/tencentcloudstack/tencentcloud/latest/docs/resources/subnet). 

## Outputs

| Name | Description |
|------|-------------|
| vpc\_id | The ID of the VPC being created |
| subnets\_names | The list of names for the subnets being created |
| subnets\_ids | The list of IDS for the subnets being created |
| subnets\_ips | The list of CIDRs for the subnets being created |
| subnets\_azs | The list of Availability Zones for the subnets being created |
| custom\_route\_table\_names | The list of names for the route tables being created |
| custom\_route\_table\_ids | The list of IDs for the route tables being created |
| route\_entry\_ids | The list of IDs for the route entries being created |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
