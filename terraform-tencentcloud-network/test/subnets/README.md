# Subnets Module Test

This snippet tests the subnets module by configuring subnet(s) in an existing VPC. 


<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| region | The region of the network being created | `string` | na-siliconvalley | yes |
| vpc\_id | The ID of existing VPC to create subnet(s) in |
 
When we don't pass in a route table information to subnet, subnet will use the default route table of the VPC. 

## Outputs

| Name | Description |
|------|-------------|
| subnets | The subnet object(s) of created subnet resources. |
| subnets\_name\_id | The name-id map of created subnet resources. |
