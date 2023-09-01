output "iam_role_name" {
  value = aws_iam_role.iam_role.name
}
output "config_file" {
  value = yamldecode("../${var.config_file}")
}