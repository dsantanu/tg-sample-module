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
  config_path = "../../genesis/${local.values.run_acc}"
}

dependencies {
  paths = [
"../../genesis/${local.values.run_acc}"
]
}

terraform {
  source = "${local.values.tf_repo_pfx}-${local.module_name}?ref=${local.values.module_branch}"
}
