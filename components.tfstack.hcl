# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

variable "prefix" {
  type = string
}

variable "instances" {
  type = number
}

required_providers {
  random = {
    source  = "hashicorp/random"
    version = "~> 3.5.1"
  }

  null = {
    source  = "hashicorp/null"
    version = "~> 3.2.2"
  }

#  derp = {
#    source = "tfcdev-86ee0655.ngrok.io/hashicorp/derp"
#    version = "1.0.3"
#  }
}

provider "random" "this" {}
provider "null" "this" {}

# provider "derp" "this" {}

component "pet" {
  source = "git::https://github.com/mjyocca/pet-nulls-component.git//pet"
  # source = "./pet"

  inputs = {
    prefix = var.prefix
  }

  providers = {
    random = provider.random.this
    null = provider.null.this
#    derp = provider.derp.this
  }
}

component "nulls" {
 ##  source = "./nulls"
  source = "git::https://github.com/mjyocca/nulls-null-component.git//nulls"

  inputs = {
    pet       = component.pet.name
    instances = var.instances
  }

  providers = {
    null = provider.null.this
  }
}
