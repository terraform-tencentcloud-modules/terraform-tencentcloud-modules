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
  value       = module.vpc.vpc_id
}

output "subnets_names" {
  value       = [for subnet in module.subnets.subnets : subnet.name]
  description = "The names of the subnets being created"
}

output "subnets_ids" {
  value       = [for subnet in module.subnets.subnets: subnet.id]
  description = "The IDs of the subnets being created"
}

output "subnets_ips" {
  value       = [for subnet in module.subnets.subnets : subnet.cidr_block]
  description = "The IPs and CIDRs of the subnets being created"
}

output "subnets_azs" {
  value       = [for subnet in module.subnets.subnets : subnet.availability_zone]
  description = "The availability zones of the subnets being created"
}

output "custom_route_table_names" {
  value       = [for table in module.custom_route_tables.custom_route_tables : table.name]
  description = "The names of the route tables being created"
}

output "custom_route_table_ids" {
  value       = [for table in module.custom_route_tables.custom_route_tables : table.id]
  description = "The IDs of the route tables being created"
}

output "route_entry_ids" {
  value       = [for entry in module.route_entries.route_entries : entry.id]
  description = "The IDs of the route entries being created"
}
