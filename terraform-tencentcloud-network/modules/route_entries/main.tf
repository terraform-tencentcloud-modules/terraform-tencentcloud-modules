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
  entries = {
    for x in var.route_entries :
    "${x.destination_cidr_block}/${x.next_hub}" => x
  }
}

resource "tencentcloud_route_table_entry" "route_entry" {

  for_each = local.entries

  # TODO: The default route table id should be the default route table id instead of empty string (""). 
  route_table_id = lookup(each.value,"route_table_id", lookup(var.custom_route_tables, each.value.route_table_name, ""))
  destination_cidr_block        = each.value.destination_cidr_block
  next_type         = each.value.next_type
  next_hub          = each.value.next_hub
  description       = lookup(each.value, "description", "")
}
