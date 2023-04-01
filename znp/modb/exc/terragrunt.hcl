##
include {
  path = find_in_parent_folders()
}

locals {
  values = merge(
    yamldecode(file(find_in_parent_folders("global.yaml"))),
    yamldecode(file(find_in_parent_folders("common.yaml"))),
    yamldecode(file("variables.yaml")),
  )
}

dependency "moda" {
  config_path = "../../moda/${local.values.run_acc}"
}

dependencies {
  paths = [
    "../../moda/${local.values.run_acc}"
  ]
}

inputs = merge(
  local.values,
  {
    dependent_value = dependency.moda.outputs.file_name
  }
)

terraform {
  source = "${local.values.tf_repo_pfx}-${local.values.module_name}?ref=${local.values.module_branch}"
}
