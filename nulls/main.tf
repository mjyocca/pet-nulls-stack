# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

terraform {
  required_providers {
    null = {
      source = "hashicorp/null"
      version = "3.1.1"
    }
  }
}

# module "echo" {
#  source  = "tfcdev-86ee0655.ngrok.io/hashicorp/echo/null"
#  version = "1.0.0"
##  charlie = "hello"
#  echo = "world"
## }

variable "pet" {
  type = string
}

variable "instances" {
  type = number
}

resource "null_resource" "this" {
  count = var.instances

  triggers = {
    pet = var.pet
  }
}

output "ids" {
  value = [for n in null_resource.this: n.id]
}
