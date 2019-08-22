/**
 * Copyright 2019 Google LLC
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

variable "project_id" {
  description = "The ID of the project in which to provision resources."
  type        = string
}

variable "bucket_name" {
  description = "The name of the bucket to create."
  type        = string
}

variable "cluster_name" { default = "mariadb" }
variable "instance_count" { default = 4 }

variable "region" {
  default = {
    "0" = "us-east1"
    "1" = "us-east1"
    "2" = "us-east1"
    "3" = "us-east1"
  }
}

variable "zone" {
  default = {
    "0" = "us-east1-b"
    "1" = "us-east1-b"
    "2" = "us-east1-b"
    "3" = "us-east1-b"
  }
}

variable "subnetwork" {
  default = {
    "0" = "default"
    "1" = "default"
    "2" = "default"
    "3" = "default"
  }
}

variable "garb_instance_type" { default = "n1-standard-1" }
variable "garb_zone" { default = "us-east1-a" }
variable "garb_region" { default = "us-east1" }
variable "garb_subnetwork" { default = "default" }
variable "network_project" { default = "default" }
variable "network" { default = "default" }
variable "service_account" { default = "mariadb" }
variable "instance_type" { default = "n1-standard-2" }
variable "client_ip_range" { default = "10.0.0.0/8" }
variable "pass" { default = "changeit" }
variable "replpass" { default = "changeit" }
variable "statspass" { default = "changeit" }
variable "disk_size_gb" { default = 128 }
variable "disk_type" { default = "pd-standard" }
variable "health_check" { default = "mariadb" }

variable "databases" {
  description = "Space separated list of databases to be created."
  type        = string
  default     = "db"
}

variable "template_version" {
  description = "A version identifier included in instance template names."
  type        = string
  default     = "v1"
}
