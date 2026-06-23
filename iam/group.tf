locals {

  groups = [
    "devops-lab",
    "developer-lab",
    "admin-lab",
    "cloud-lab",
    "intern-lab"
  ]

}

resource "aws_iam_group" "groups" {

  for_each = toset(local.groups)

  name = "${each.value}-group"

}
