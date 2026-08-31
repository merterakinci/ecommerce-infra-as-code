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
- [X] VPC and networking layer
- [X] RDS database
- [ ] Application deployment via ECS/Kubernetes
- [ ] Security scanning (Checkov/tfsec) in CI/CD

## Status: Completed (Phase 1-3)
All AWS resources have been destroyed to avoid ongoing costs.
See [final project summary](./docs/ecommerce-infra-as-code_final_summary.pdf) for full details.

Kubernetes learning continues in a separate repository: [k8s-labs](https://github.com/merterakinci/k8s-labs)
