# Terraform Subnets Module

This submodule is part of the the `terraform-tencentcloud-network` module. It creates the individual VPC subnets.

It supports creating:

- Subnets within vpc network.

## Usage

Basic usage of this submodule is as follows:

```hcl
data "tencentcloud_vpc_instances" "id_instances" {
  vpc_id = var.vpc_id
}

module "subnet" {
    source  = "terraform-tencentcloud-modules/terraform-tencentclouid-network/modules/subnets"

    vpc_id = data.tencentcloud_vpc_instances.id_instances.vpc_id

    subnets = [
       {
         name = "subnet1"
         availability_zone = "na-siliconvalley-1"
         cidr_block = "10.0.0.0/24"
       },
       {
         name              = "subnet2"
         availability_zone = "na-siliconvalley-2"
         cidr_block        = "10.0.1.0/24"
         route_table_id    = "rtb-lun4h2da"
         tags = {
           description = "subnet_tag"
         }
       }
    ]
}
```

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| vpc\_id | The ID of VPC for the subnets to be created into | `string` | n/a | yes |
| tags | The common tags added to the subnets. | `map(string)` | `{}` | no |
| subnets | The list of subnets to be created | `list(any)` | - | yes |
| custom\_route\_tables | The name-id map of route tables. If any subnet uses route\_table\_name to associate route table, this name-to-id map for the route table(s) if required. | `map(string)` | `{}` | no |


## Outputs

| Name | Description |
|------|-------------|
| subnets | A map with keys of form availability\_zone/cidr\_block and values being the outputs of the tencentcloud\_subnet resources used to create corresponding subnets. |
| subnets\_name\_id | The name-id map of created subnet resources. |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
