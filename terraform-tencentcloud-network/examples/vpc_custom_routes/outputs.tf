/**
 * Copyright 2020 Tencent Cloud, LLC
 *
 * Licensed under the Mozilla Public License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      https://www.mozilla.org/en-US/MPL/2.0/
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

output "vpc_id" {
  description = "The id of vpc."
  value       = module.test.vpc_id
}

output "subnets_names" {
  value       = module.test.subnets_names
  description = "The names of the subnets being created"
}

output "subnets_ids" {
  value       = module.test.subnets_ids
  description = "The IDs of the subnets being created"
}

output "subnets_ips" {
  value       = module.test.subnets_ips
  description = "The IPs and CIDRs of the subnets being created"
}

output "subnets_azs" {
  value       = module.test.subnets_azs
  description = "The availability zones of the subnets being created"
}

output "custom_route_table_names" {
  value       = module.test.custom_route_table_names
  description = "The names of the route tables being created"
}

output "custom_route_table_ids" {
  value       = module.test.custom_route_table_ids
  description = "The IDs of the route tables being created"
}

output "route_entry_ids" {
  value       = module.test.route_entry_ids
  description = "The IDs of the route entries being created"
}
