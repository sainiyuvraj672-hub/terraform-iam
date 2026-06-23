
output "password" {
  value = {
    for k, v in aws_iam_user_login_profile.password :
    k => v.password
  }
  sensitive = true
}
