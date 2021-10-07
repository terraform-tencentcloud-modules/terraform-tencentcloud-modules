# Terraform Route Entry Module

This submodule is part of the the `terraform-tencentcloud-network` module. It creates the individual route table entries.

It supports creating:

- Custom route tables entries into a route table within vpc network.

## Usage

Basic usage of this submodule is as follows:

```hcl

module "rte_foo" {
    source  = "terraform-tencentcloud-modules/terraform-tencentclouid-network/modules/route_entries"

    # The route table name to id mapping
    custom_route_tables = {
      "cr_table1" = "rtb-lun4h2da"
    }

    route_entries = [
      {
         route_table_name       = "cr_table1"
         destination_cidr_block = "10.4.4.0/24"
         next_type              = "EIP"
         next_hub               = "0"
         description            = "ci-test-route-table-entry1"
      },
      {
         route_table_id         = "rtb-lun4h2da"
         destination_cidr_block = "10.4.5.0/24"
         next_type              = "EIP"
         next_hub               = "0"
         description            = "ci-test-route-table-entry2"
      }
    ]
}
```

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| custom\_route\_tables | The name-id map of route tables. This field is required only if route\_table\_name is used in the route\_entries. | `map(string)` | n/a | no |
| route\_entries | The list of custom route table entries to be created. | `list` | - | yes |


## Outputs

| Name | Description |
|------|-------------|
| route\_entries | The list of all created custom route entries. |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
