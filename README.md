# E-commerce Infrastructure as Code

Learning project for building e-commerce infrastructure on AWS using Terraform.

## Tech Stack
- Terraform
- AWS (S3, VPC, RDS, ECS — planned)

## Project Structure
.
├── main.tf # Core resource definitions
├── variables.tf # Input variables
├── outputs.tf # Output values after apply
└── README.md

## How to Run
```bash
terraform init
terraform plan
terraform apply
```

## Progress
- [x] AWS provider setup
- [x] First S3 bucket resource (refactored with variables)
- [ ] VPC and networking layer
- [ ] RDS database
- [ ] Application deployment via ECS/Kubernetes
- [ ] Security scanning (Checkov/tfsec) in CI/CD
