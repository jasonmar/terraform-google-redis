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

provider "random" {
  version = "~> 2.0"
}

resource "random_pet" "main" {
  length    = 1
  prefix    = "cft-mariadb"
  separator = "-"
}

resource "google_compute_network" "test" {
  project                 = "${var.project_id}"
  name                    = "${random_pet.main.id}"
  auto_create_subnetworks = "false"
}

resource "google_compute_subnetwork" "test" {
  project                  = "${var.project_id}"
  region                   = "us-east1"
  network                  = "${google_compute_network.test.self_link}"
  name                     = "${random_pet.main.id}"
  ip_cidr_range            = "10.0.0.0/24"
  private_ip_google_access = "true"
}

module "example" {
  source = "../../../examples/mariadb"

  project_id   = var.project_id
  bucket_name  = random_pet.main.id
  cluster_name = "${var.cluster_name}"
  databases    = "db"
  region = {
    "0" = "us-east1"
    "1" = "us-east1"
    "2" = "us-east1"
    "3" = "us-east1"
  }
  zone = {
    "0" = "us-east1-b"
    "1" = "us-east1-b"
    "2" = "us-east1-b"
    "3" = "us-east1-b"
  }
  garb_zone          = "us-east1-a"
  garb_instance_type = "n1-standard-1"
  garb_region        = "us-east1"
  garb_subnetwork    = random_pet.main.id
  network_project    = var.project_id
  subnetwork = {
    "0" = random_pet.main.id
    "1" = random_pet.main.id
    "2" = random_pet.main.id
    "3" = random_pet.main.id
  }
  health_check_name = "mariadb"
  service_account   = "mariadb"
  instance_type     = "n1-standard-2"
  disk_size_gb      = "32"
  disk_type         = "pd-standard"
  client_ip_range   = "0.0.0.0/0"
  pass              = "changeit"
  statspass         = "changeit"
  replpass          = "changeit"
  instance_count    = "4"
  template_version  = "v1"
}
