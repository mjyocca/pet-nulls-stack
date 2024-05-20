# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

terraform {
  required_providers {
    random = {
      source = "hashicorp/random"
      version = "3.3.2"
    }

    derp = {
      source = "tfcdev-86ee0655.ngrok.io/hashicorp/derp"
      version = "1.0.3"
    }
  }
}

#data "derp_example" "example" {
#  configurable_attribute = "some-value"
#}

#data "derp_example" "example_2" {
#  configurable_attribute = "some-value"
#}

module "echo" {
  source  = "tfcdev-86ee0655.ngrok.io/hashicorp/echo/null"
  version = "1.0.0"
  charlie = "hello"
  echo = "world"
}

variable "prefix" {
  type = string
}

resource "random_pet" "this" {
  prefix = var.prefix
  length = 6
}

output "name" {
  value = random_pet.this.id
}
