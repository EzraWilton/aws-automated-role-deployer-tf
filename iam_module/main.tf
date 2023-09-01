variable "policy_file" {
  default = ""
}
locals {
  user_data = fileexists(var.config_file) ? yamldecode(file(var.config_file)) : jsondecode(file(var.config_file))
  role_name = local.user_data.Parameters.RoleName
  time_start = local.user_data.Parameters.TimeStart
  time_end = local.user_data.Parameters.TimeEnd
  date_start = local.user_data.Parameters.DateStart
  date_end = local.user_data.Parameters.DateEnd
  user_list = local.user_data.Parameters.UserList
  policy_path = local.user_data.Parameters.PolicyPath //!= "" ? local.user_data.Parameters.PolicyPath : null
  managed_policies = local.user_data.Parameters.ManagedPolicies
  account_id = local.user_data.Parameters.AccountId

}

data "aws_iam_policy" "aws_managed_policies" {
  for_each = toset(local.managed_policies)
  name = each.value
}

resource "aws_iam_role" "iam_role" {
    name = local.role_name
    assume_role_policy = templatefile("./iam_module/trust.json", {
        time_start = local.time_start
        date_start = local.date_start
        time_end = local.time_end
        date_end = local.date_end
        account_id = local.account_id
        user_email = local.user_list[*]
        }
    )
    managed_policy_arns = [for k, v in data.aws_iam_policy.aws_managed_policies: v.arn]
    dynamic "inline_policy" {
      for_each = local.policy_path
      content {
        name = "inline-policy"
        policy = file(inline_policy.value)
      }
    }
}


