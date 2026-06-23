resource "aws_iam_user" "users" {

  for_each = {
    for u in local.users :
    u.user_name => u
  }

  name = each.value.user_name

  tags = {
    role  = each.value.role_name
    email = each.value.email
  }
}

resource "aws_iam_user_group_membership" "membership" {

  depends_on = [
    aws_iam_user.users,
    aws_iam_group.groups
  ]

  for_each = {
    for u in local.users :
    u.user_name => u
  }

  user = each.key

  groups = [
    "${each.value.role_name}-lab-group"
  ]

}
resource "aws_iam_user_login_profile" "password" {
  for_each                = aws_iam_user.users
  user                    = each.value.name
  password_reset_required = true

}
