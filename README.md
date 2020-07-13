# AppId terraform module

Terraform module to provision an instance of AppId into an account and optionally bind the credentials into a set of
cluster namespaces.

## Software dependencies

The module depends on the following software components:

### Command-line tools

- terraform - v12
- kubectl

### Terraform providers

- IBM Cloud provider >= 1.5.3

## Module dependencies

This module makes use of the output from other modules:

- Cluster - github.com/ibm-garage-cloud/terraform-ibm-container-platform.git

## Example usage

```hcl-terraform
module "dev_infrastructure_appid" {
  source = "github.com/ibm-garage-cloud/terraform-ibm-appid.git?ref=v1.0.0"

  resource_group_name = module.dev_cluster.resource_group_name
  resource_location   = module.dev_cluster.region
  cluster_id          = module.dev_cluster.id
  namespaces          = [module.dev_tools_namespace.name]
  namespace_count     = 1
  name_prefix         = var.name_prefix
  tags                = [module.dev_cluster.tag]
}
```
