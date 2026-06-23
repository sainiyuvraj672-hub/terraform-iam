locals {

  group_policies = {

    "devops-lab" = [
      "arn:aws:iam::aws:policy/AmazonEC2FullAccess",
      "arn:aws:iam::aws:policy/AmazonS3FullAccess"
    ]

    "developer-lab" = [
      "arn:aws:iam::aws:policy/AmazonEC2FullAccess",
      "arn:aws:iam::aws:policy/AmazonRDSFullAccess",
      "arn:aws:iam::aws:policy/AWSLambda_FullAccess"
    ]

    "admin-lab" = [
      "arn:aws:iam::aws:policy/IAMFullAccess"
    ]

    "cloud-lab" = [
      "arn:aws:iam::aws:policy/CloudWatchFullAccess",
      "arn:aws:iam::aws:policy/AmazonS3ReadOnlyAccess"
    ]

    "intern-lab" = [
      "arn:aws:iam::aws:policy/IAMUserChangePassword",
      "arn:aws:iam::aws:policy/ReadOnlyAccess"
    ]
  }

  attach = flatten([

    for grp, policies in local.group_policies : [

      for policy in policies : {
        group  = grp
        policy = policy
      }

    ]

  ])
}

resource "aws_iam_group_policy_attachment" "attach" {

  for_each = {
    for x in local.attach :
    "${x.group}-${basename(x.policy)}" => x
  }

  group = aws_iam_group.groups[each.value.group].name

  policy_arn = each.value.policy
}
