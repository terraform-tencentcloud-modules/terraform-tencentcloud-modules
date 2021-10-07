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
variable "tags" {
  description = "The common tags added to all resources."
  type        = map(string)
  default     = {}
}

variable "vpc_id" {
  type        = string
  description = "The optional vpc id"
}

variable "route_tables" {
  type        = list(object({name=string, tags=map(string)}))
  description = "The list of custom route tables to be created"
}

