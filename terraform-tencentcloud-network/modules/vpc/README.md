# Terraform VPC Module

This submodule is part of the the `terraform-tencentcloud-network` module. It creates a vpc network.

It supports creating:

- A VPC Network
- Optionally not create new VPC if an existing vpc_id is passed in.

## Usage

Basic usage of this submodule is as follows:

```hcl
module "vpc" {
    source  = "terraform-tencentcloud-modules/terraform-tencentclouid-network/modules/vpc"

    vpc_name = "simple-vpc-test"
    vpc_cidr = "10.0.0.0/16"

    tags = {
      module = "vpc"
      created_by = "terraform_tester"
    }
}
```

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| vpc\_id | The optional VPC ID for existing VPC. If this value is passed in, no new VPC will be created. | `string` | n/a | no |
| vpc\_name | The VPC name used to launch a new VPC. | `string` | `"tf-modules-vpc"` | no |
| vpc\_cidr | The cidr block used to launch a new vpc. A required field for creating new VPC. | `string` | n/a | yes|
| vpc\_is\_multicast | Specify whether the vpc is multicast. | `bool` | `true` | no |
| vpc\_dns\_servers | Specify the vpc dns servers. | `list(string)` | `[]` | no |
| vpc\_tags | Additional tags added specifically to the VPC. | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| vpc\_id | The ID of the VPC being created |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
