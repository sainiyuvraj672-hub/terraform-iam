# AWS IAM Automation using Terraform

![Terraform](https://img.shields.io/badge/Terraform-IaC-blue)
![AWS](https://img.shields.io/badge/AWS-IAM-orange)
![Status](https://img.shields.io/badge/Status-Completed-green)

---

# AWS IAM Automation using Terraform

## Project Description

This project automates AWS Identity and Access Management (IAM) using Terraform.

The goal of this project is to eliminate manual IAM management from the AWS Console by creating users, groups, permissions, and console login access automatically using Infrastructure as Code (IaC).

User details such as username, role, and email are stored inside a CSV file. Terraform reads the CSV file and provisions AWS IAM resources automatically.

This project performs the following operations:

1. Creates multiple IAM users from CSV input
2. Assigns tags such as role and email
3. Creates IAM groups automatically
4. Assigns users to groups based on their roles
5. Attaches different IAM policies to groups
6. Generates console login profiles and temporary passwords
7. Produces Terraform outputs for user information
8. Visualizes infrastructure dependency using Terraform Graph

This project simulates how organizations manage onboarding and access control for employees at scale.

---

## Example Workflow

```text
users.csv
   ↓
IAM Users
   ↓
IAM Groups
   ↓
Policy Attachment
   ↓
User → Group Assignment
   ↓
Console Password Generation
   ↓
AWS IAM Ready
```

---

## Technologies Used

* Terraform
* AWS IAM
* AWS CLI
* Graphviz
* CSV
* Linux
* VS Code

---

## Features

✔ Create multiple IAM users at once
✔ Create groups automatically
✔ Assign users to groups automatically
✔ Attach permissions to groups
✔ Generate console login passwords
✔ Tag users with email and role
✔ Infrastructure as Code (IaC)

---

## Architecture

```text
users.csv
      │
      ▼
aws_iam_user
      │
      ▼
aws_iam_group
      │
      ▼
aws_iam_group_policy_attachment
      │
      ▼
aws_iam_user_group_membership
      │
      ▼
aws_iam_user_login_profile
```

---

## Project Structure

```text
iam/
│
├── provider.tf
├── terraform.tf
├── terraform.tfvars
├── var.tf
├── users.csv
├── main.tf
├── user.tf
├── group.tf
├── policy.tf
├── output.tf
├── terraform.tfstate
├── graph.pdf
└── README.md
```

---

## Prerequisites

Install:

* Terraform
* AWS CLI
* Graphviz

Verify:

```bash
terraform -version
aws --version
```

---

## Configure AWS

Configure AWS credentials:

```bash
aws configure
```

Provide:

```text
AWS Access Key ID
AWS Secret Access Key
Region
Output format
```

---

## CSV Input Format

Example:

```csv
user_name,role_name,email
yuvraj,devops,yuv@example.com
rahul,developer,rahul@example.com
mini,admin,mini@example.com
john,intern,john@example.com
aman,devops,aman@example.com
neha,intern,neha@example.com
ravi,cloud,ravi@example.com
```

---

## User Groups and Policies

### DevOps Group

Permissions:

* AmazonEC2FullAccess
* AmazonS3FullAccess
* AmazonVPCFullAccess

---

### Developer Group

Permissions:

* AmazonEC2FullAccess
* AmazonRDSFullAccess
* AWSLambda_FullAccess

---

### Admin Group

Permissions:

* IAMFullAccess

---

### Cloud Group

Permissions:

* CloudWatchFullAccess
* AmazonS3ReadOnlyAccess

---

### Intern Group

Permissions:

* IAMUserChangePassword
* ReadOnlyAccess

---

## Initialize Terraform

```bash
terraform init
```

Expected:

```text
Terraform has been successfully initialized
```

---

## Validate Configuration

```bash
terraform validate
```

---

## Preview Infrastructure

```bash
terraform plan
```

Terraform displays:

* Users
* Groups
* Policies
* Memberships
* Login Profiles

---

## Deploy Infrastructure

Create resources:

```bash
terraform apply -auto-approve
```

Expected:

```text
Apply complete!
```

---

## View Outputs

Show usernames:

```bash
terraform output usernames
```

Show passwords:

```bash
terraform output -json passwords
```

---

## Generate Infrastructure Graph

Install Graphviz:

```bash
sudo yum install graphviz -y
```

Generate graph:

```bash
terraform graph | dot -Tpdf > graph.pdf
```

Open:

```bash
graph.pdf
```

---

## Destroy Infrastructure

Remove in order:

### Policy Attachments

```bash
terraform destroy -target=aws_iam_group_policy_attachment.attach
```

### Group Membership

```bash
terraform destroy -target=aws_iam_user_group_membership.membership
```

### Groups

```bash
terraform destroy -target=aws_iam_group.groups
```

### Users

```bash
terraform destroy -target=aws_iam_user.users
```

Final cleanup:

```bash
terraform destroy
```

---

## Common Errors

### Group already exists

```text
EntityAlreadyExists
```

Fix:

```bash
terraform import
```

---

### Cannot delete group

```text
DeleteConflict
```

Solution:

Remove memberships first.

---

### Password output not visible

```text
Sensitive output hidden
```

Use:

```bash
terraform output -json passwords
```

---

## Learning Outcomes

This project demonstrates:

* Infrastructure as Code
* Terraform Iteration
* CSV Parsing
* IAM Automation
* Role Based Access Control (RBAC)
* AWS Permissions Management
* Dependency Handling
* Terraform State Management

---

## Future Improvements

* Store passwords in AWS Secrets Manager
* Send onboarding emails automatically
* Enable MFA
* Generate Access Keys automatically
* Integrate with CI/CD
* Convert to Terraform modules

---

## Conclusion

This project automates IAM user lifecycle management using Terraform.

It creates users, assigns groups, applies policies, generates passwords, and manages permissions automatically using Infrastructure as Code.

This reduces manual effort and improves scalability and consistency.

---

## Author

**Yuvraj Saini**
BCA | DevOps | AWS | Terraform Learning Project
