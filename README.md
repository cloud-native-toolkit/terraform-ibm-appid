# AppId terraform module

Terraform module to provision an instance of AppId into an account.

## Software dependencies

The module depends on the following software components:

### Command-line tools

- terraform - v12
- kubectl

### Terraform providers

- IBM Cloud provider >= 1.5.3

## Module dependencies

None

## Example usage

[Refer test cases for more details](test/stages/stage-appid.tf)

```hcl-terraform
module "dev_infrastructure_appid" {
  source = "github.com/ibm-garage-cloud/terraform-ibm-appid.git?ref=v1.0.0"

  resource_group_name = module.dev_cluster.resource_group_name
  resource_location   = module.dev_cluster.region
  tags                = [module.dev_cluster.tag]
}
```
