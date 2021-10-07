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

/******************************************
	VPC configuration
 *****************************************/
module "vpc" {
  source = "./modules/vpc"

  vpc_id           = var.vpc_id
  vpc_name         = var.vpc_name
  vpc_cidr         = var.vpc_cidr
  vpc_is_multicast = var.vpc_is_multicast
  vpc_dns_servers  = var.vpc_dns_servers
  vpc_tags         = merge(var.tags, var.vpc_tags)
}

/******************************************
        Custom Route Tables
 *****************************************/
module "custom_route_tables" {
  source = "./modules/route_tables"

  vpc_id = module.vpc.vpc_id
  tags = var.tags
  route_tables = var.custom_route_tables
}

/******************************************
	Subnet configuration
 *****************************************/
module "subnets" {
  source = "./modules/subnets"
  
  vpc_id = module.vpc.vpc_id
  custom_route_tables = var.custom_route_tables == [] ? {} : module.custom_route_tables.custom_route_tables_name_id
  subnets     = var.subnets
  tags = var.tags
}


/******************************************
        Route Entries
 *****************************************/
module "route_entries" {
  source = "./modules/route_entries"

  custom_route_tables = var.custom_route_tables == [] ? {} : module.custom_route_tables.custom_route_tables_name_id
  route_entries = var.route_entries
}
