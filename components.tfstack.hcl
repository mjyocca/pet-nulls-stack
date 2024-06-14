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
}

provider "random" "this" {}
provider "null" "this" {}

# provider "derp" "this" {}

component "pet" {
  # source = "git::https://github.com/mjyocca/pet-nulls-component.git//pet?ref=v1.0.0"
  source = "./pet"

  inputs = {
    prefix = var.prefix
  }

  providers = {
    random = provider.random.this
    null = provider.null.this
  }
}

component "nulls" {
  # source = "git::https://github.com/mjyocca/nulls-null-component.git//nulls"
  source = "./nulls"

  inputs = {
    pet       = component.pet.name
    instances = var.instances
  }

  providers = {
    null = provider.null.this
  }
}
