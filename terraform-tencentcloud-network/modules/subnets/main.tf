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

locals {
  subnets = {
    for x in var.subnets :
    "${x.availability_zone}/${x.cidr_block}" => x
  }
}

resource "tencentcloud_subnet" "subnet" {
  for_each          = local.subnets
  vpc_id            = var.vpc_id
  name              = each.value.name
  availability_zone = each.value.availability_zone
  cidr_block        = each.value.cidr_block

  tags         = merge(var.tags, lookup(each.value, "tags", {}))
  is_multicast = lookup(each.value, "is_multicast", "false")

  # If route_table_id is configured, use the route_table_id value. Otherwise, use the value of "route_table_name" to find the route_table_id.
  route_table_id = lookup(each.value, "route_table_id", lookup(var.custom_route_tables, lookup(each.value, "route_table_name", ""), ""))
}
