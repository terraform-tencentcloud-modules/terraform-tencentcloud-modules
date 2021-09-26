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
  vpc_name = "simple-vpc-jliao"
  vpc_cidr = "10.0.0.0/16"

  subnets = [
    {
      name = "subnet1"
      availability_zone = "na-siliconvalley-1"
      cidr_block = "10.0.0.0/24"
    },
    {
      name = "subnet2"
      availability_zone = "na-siliconvalley-2"
      cidr_block = "10.0.1.0/24"
    }
  ]

  subnet_tags = {
    description = "subnet_tag"
  }

  tags = {
    module = "vpc"
    created_by = "terraform_tester"
  }

}
