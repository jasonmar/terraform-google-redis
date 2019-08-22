# Terraform broker Module for GCP

This repository contains Terraform Modules used to launch a GCP Token Broker HA Cluster on Google Cloud.

The core template creates two 3-node clusters for Authorizer and Broker applications.

## Description

The template writes an installation script to a Cloud Storage Bucket. The installation script installs broker Server, broker Sentinel, and StackDriver Agent. Instance Templates are configured such that any Instance created from the template will download and runs the installation script at startup. Managed Instance Groups use an Instance Template to create cluster member instances and replace each instance that becomes unhealthy.


## Failover Characteristics

Systemd will restart broker if the process is stopped on an individual instance.

broker Sentinel will promote a new master node to accept writes if the current master becomes unresponsive.

Managed Instance Group runs a TCP health check and will replace any instance that is unresponsive multiple times in a row.


## Usage

Basic usage of this module is as follows:

```hcl
module "broker" {
  source  = "terraform-google-modules/broker/google"
  version = "~> 0.1"

  project_id  = "<PROJECT ID>"
  bucket_name = "gcs-test-bucket"
}
```

Functional examples are included in the
[examples](./examples/) directory.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| bucket\_name | The name of the bucket to create | string | n/a | yes |
| project\_id | The project ID to deploy to | string | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| bucket\_name |  |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Requirements

These sections describe requirements for using this module.

### Software

The following dependencies must be available:

- [Terraform][terraform] v0.12
- [Terraform Provider for GCP][terraform-provider-gcp] plugin v2.0
- [Terraform Beta Provider for GCP][terraform-provider-google-beta] plugin v2.0

### Service Account

A service account with the following roles must be used to provision
the resources of this module:

- Storage Admin: `roles/storage.admin`

The [Project Factory module][project-factory-module] and the
[IAM module][iam-module] may be used in combination to provision a
service account with the necessary roles applied.

### APIs

A project with the following APIs enabled must be used to host the
resources of this module:

- Google Cloud Storage JSON API: `storage-api.googleapis.com`

The [Project Factory module][project-factory-module] can be used to
provision a project with the necessary APIs enabled.

## Contributing

Refer to the [contribution guidelines](./CONTRIBUTING.md) for
information on contributing to this module.

[iam-module]: https://registry.terraform.io/modules/terraform-google-modules/iam/google
[project-factory-module]: https://registry.terraform.io/modules/terraform-google-modules/project-factory/google
[terraform-provider-gcp]: https://www.terraform.io/docs/providers/google/index.html
[terraform-provider-google-beta]: https://github.com/terraform-providers/terraform-provider-google-beta/blob/master/google-beta/
[terraform]: https://www.terraform.io/downloads.html
