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

module "test" {
  source          = "../../../terraform-tencentcloud-network"
 
  vpc_id = var.vpc_id
  
  custom_route_tables = [
    {
      name = "customer_route_table1"
      tags = {
         module = "crt_tag1"
      }
    } #,
    #{
    #  name = "customer_route_table2"
    #  tags = {
    #     models = "crt_tag2"
    #  }
    #}
   ]  

  tags = {
    description = "common_tags"
  }
}
