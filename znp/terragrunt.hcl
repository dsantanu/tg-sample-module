##

// Localy defined variabls
locals {
  values = merge(
    yamldecode(file("common.yaml")),
    yamldecode(file(find_in_parent_folders("global.yaml"))),
    yamldecode(file("${path_relative_to_include()}/variable.yaml")),
  )
}

// Input variables available to TF
inputs = merge(
  local.values,
  {
    kb_item = "TG_KB690"
  }
)

// Basic Terraform config
terraform {
  extra_arguments "init_args" {
    commands = [
      "init"
    ]
    arguments = ["-reconfigure"]
  }

  extra_arguments "no-input" {
    commands = [
      "apply",
      "plan"
    ]
    arguments = ["-input=false"]
  }

  before_hook "run_validate" {
    commands     = ["plan", "apply"]
    execute      = ["terraform", "validate"]
    run_on_error = true
  }
}
