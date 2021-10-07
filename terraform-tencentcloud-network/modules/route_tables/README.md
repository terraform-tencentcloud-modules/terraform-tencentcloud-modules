# Terraform Route Table Module

This submodule is part of the the `terraform-tencentcloud-network` module. It creates the individual VPC route tables.

It supports creating:

- Custom route tables within vpc network.

## Usage

Basic usage of this submodule is as follows:

```hcl
data "tencentcloud_vpc_instances" "id_instances" {
  vpc_id = var.vpc_id
}

module "rt_foo" {
    source  = "terraform-tencentcloud-modules/terraform-tencentclouid-network/modules/route_tables"

    vpc_id  = data.tencentcloud_vpc_instances.id_instances.vpc_id
    tags    = {
      common_tag = "test common"
    }

    route_tables = [
      {
         name   = "cr_table1"
         tags   = {
           bu   = "rtbl_test1" 
         }
      },
      { 
         name   = "cr_table2"
         tags   = {
           bu   = "rtbl_test2"
         }
      }
    ]
}
```

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| vpc\_id | The ID of VPC for route table(s) to be created into | `string` | n/a | yes |
| tags | The common tags added to the subnets. | `map(string)` | `{}` | no |
| route\_tables | The list of custom route tables to be created. | `list` | - | yes |


## Outputs

| Name | Description |
|------|-------------|
| custom\_route\_tables | A map with keys of name and values being the outputs of the tencentcloud\_route\_table resources used to create corresponding route tables. |
| custom\_route\_tables\_name\_id | The name-id map of created route table resources. |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
