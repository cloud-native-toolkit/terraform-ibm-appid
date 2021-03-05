provider "ibm" {
  version = ">= 1.5.3"
}

data "ibm_resource_group" "tools_resource_group" {
  name = var.resource_group_name
}

locals {
  role              = "Writer"
  name_prefix       = var.name_prefix != "" ? var.name_prefix : var.resource_group_name
  resource_location = var.resource_location
}

// AppID - App Authentication
resource "ibm_resource_instance" "appid_instance" {
  name              = "${replace(local.name_prefix, "/[^a-zA-Z0-9_\\-\\.]/", "")}-appid"
  service           = "appid"
  plan              = var.plan
  location          = local.resource_location
  resource_group_id = data.ibm_resource_group.tools_resource_group.id
  tags              = var.tags

  timeouts {
    create = "15m"
    update = "15m"
    delete = "15m"
  }
}

resource "ibm_resource_key" "appid_key" {
  name                 = "${ibm_resource_instance.appid_instance.name}-key"
  role                 = local.role
  resource_instance_id = ibm_resource_instance.appid_instance.id

  //User can increase timeouts
  timeouts {
    create = "15m"
    delete = "15m"
  }
}
