# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

terraform {
  required_providers {
    random = {
      source = "hashicorp/random"
      version = "3.3.2"
    }
  }
}

module "under_test" {
  source  = "hashicorp/dir/template"
  version = "1.0.2"

  base_dir = "${path.module}/src"
  template_vars = {
    name = "NAME IS"
  }
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
