module "iam_roles" {
  for_each = fileset(path.root, "/roles/*/*.yaml")
  source = "./iam_module"
  config_file = each.value
}
