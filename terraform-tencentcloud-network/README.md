# Terraform Network Module

This module makes it easy to set up a new VPC Network in Tencent Cloud by defining your network, subnet, route table and route table entry in a concise syntax.

It supports creating:

- A Tencent Cloud Virtual Private Network (VPC)
- Subnets within the VPC
- Custom router tables
- Custom route table entries

Sub modules are provided for creating individual vpc, subnets, routes, and route entries. See the modules directory for the various sub modules usage.

## Compatibility

This module is meant for use with Terraform 0.14+ and tested using Terraform 1.0+.
If you find incompatibilities using Terraform `>=0.14.06`, please open an issue.

## Usage
You can go to the examples folder, however the usage of the module could be like this in your own main.tf file:

```hcl
module "vpc" {
    source   = "terraform-tencent-modules/terraform-tencentcloud-network"
    version  = ">= 1.56.15"

    vpc_name = "simple-vpc-test"
    vpc_cidr = "10.0.0.0/16"

    custom_route_tables = [
      {
         name  = "cr_table1"
         tags  = {
            bu    = "rtbl_test1" 
         }
      }
    ]

    subnets = [
       {
         name              = "subnet1"
         availability_zone = "na-siliconvalley-1"
         cidr_block        = "10.0.0.0/24"
         route_table_name  = "cr_table1"
         tags              = {
            description = "test subnet any"
         }
       }
    ]

    route_entries = [
      {
         route_table_name       = "cr_table1"
         destination_cidr_block = "10.4.4.0/24"
         next_type              = "EIP"
         next_hub               = "0"
         description            = "ci-test-route-table-entry"
      }
    ]

    tags = {
      created_by = "test-terraform"
    }
}
```

Then perform the following commands on the root folder:

- `terraform init` to get the plugins
- `terraform plan` to see the infrastructure plan
- `terraform apply` to apply the infrastructure build
- `terraform destroy` to destroy the built infrastructure

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| tags | The common tags for all resources. | `map(string)` | n/a | no |
| vpc\_id | The optional existing VPC ID. If this value is set, all resources will be created into the existing VPC. | `string` | n/a  | no |
| vpc\_name | The optional VPC name. If we need to create a new VPC, it is recommended to passed in your own VPC name. | `string` | `tf-module-vpc` | no |
| vpc\_tags | The optional tags for VPC specifically. The VPC with created with the merge value of these tags and common tags | `map(string)` | n/a | no |
| vpc\_cidr | The cidr vlock used to launch a new VPC. It is required to pass in this value if a new VPC is created. | `string` | n/a | no |
| vpc\_is\_multicast | Whether the VPC is multicast | `bool` | `true` | no |
| vpc\_dns\_servers | The VPC DNS servers | `list(string)` | n/a | no |
| subnets | The list of subnets being created | `list(any)` | n/a | no |
| custom\_route\_tables | The list of custom route tables to be created | `list` | n/a | no |
| route\_entries | The list of custom route entries. | `list(map)` | n/a | no |

## Outputs

| Name | Description |
|------|-------------|
| vpc\_id | The ID of the VPC being created or updated |
| subnets | A map with keys of form availability\_zone/cidr\_block and values being the outputs of the tencentcloud\_subnet resources used to create corresponding subnets. |
| subnets\_ids | The IDs of the subnets being created |
| subnets\_ips | The IPs and CIDRs of the subnets being created |
| subnets\_names | The names of the subnets being created |
| subnets\_azs | The availability zones of the subnets being created |
| custom\_route\_table\_names | The names of the route tables being created |
| custom\_route\_table\_ids | The IDs of the route tables being created |
| route\_entry\_ids | The IDs of the route entries being created |


<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

### Subnet Inputs

The subnets list contains maps, where each object represents a subnet. Each map has the following inputs (please see examples folder for additional references):

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| name | The name of the subnet being created | `string` | - | yes |
| cidr\_block | The IP and CIDR range of the subnet being created | `string` | - | yes |
| availability\_zone | The availability zone within which the subnet should be created. | `string` | - | yes |
| is\_multicast | Indicates whether multicast is enabled. | `bool` | `true` | no |
| route\_table\_id | ID of a routing table to which the subnet should be associated. If this field is specified, the route\_table\_name field will be ignored. | `string` | - | no |
| route\_table\_name | Name of a routing table to which the subnet should be associated. If this field is specified, the module will also expect a custom\_route\_tables input which is a map of name-id of route tables. | `string` | - | no | 
| tags | Tags of the subnet. | `map(string)` | - | no |


### Route Table Inputs

The custom\_route\_tables list contains maps, where each object represents a route table to be created. Each map has the following inputs (please see examples folder for additional references):

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| name | The name of the custom route table being created | `string` | - | yes |
| tags | The tags specifically for the routing table being created. | `map(string)` | - | no |


### Route Entry Inputs

The route entry list contains maps, where each object represents a route entry. Each map has the following inputs (please see examples folder for additional references):

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| route\_table\_id | ID of routing table to which this entry belongs. Either route\_table\_id or route\_table\_name is required. | `string` | - | no |
| route\_table\_name | Name of routing table to which this entry belongs. Either route\_table\_id or route\_table\_name is required. If route\_table\_id is specified, route\_table\_name will be ignored. If route\_table\_name is used, module will also requires custom\_route\_tables input which is a name-id map of route tables. | `string` | - | no |
| destination\_cidr\_block | Destination address block. | `string` | - | yes |
| next\_type | Type of next-hop. Valid values: `CVM`, `VPN`, `DIRECTCONNECT`, `PEERCONNECTION`, `SSLVPN`, `NAT`, `NORMAL_CVM`, `EIP` and `CCN`. | `string` | - | yes |
| next\_hub | ID of next-hop gateway. Note: when next\_type is `EIP`, GatewayId should be `0`. | `string` | - | yes |
| description | The description of the route entry being created | string | - | no |

## Requirements
### Installed Software
- [Terraform](https://www.terraform.io/downloads.html) >= 0.14.06
- [Terraform Provider for Tencent Cloud](https://github.com/terraform-providers/terraform-provider-tencentcloud) >= 1.56.15

## Contributing

Refer to the [contribution guidelines](./CONTRIBUTING.md) for
information on contributing to this module.

