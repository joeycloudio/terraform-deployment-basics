# Terraform Workbench

This is my personal workspace for learning, testing, and building with Terraform.

It includes:
- Hands-on experiments with modules, variables, backends, providers, and more
- Reference patterns for real-world Terraform structure
- Mini-projects and end-to-end workflows
- Security, CI/CD, and testing integrations (e.g., Checkov, GitHub Actions)

## Folder Structure

Each subfolder contains a self-contained Terraform setup or lab, such as:

- `basic-s3-bucket/` – Simple resource with variables and tfvars
- `cicd-pipeline-lab/` – Full pipeline with nested module and test
- `e2e-testing-sandbox/` – Experiments using `.tftest.hcl` structure
- `iam-policy-examples/` – Examples of scoped IAM role creation

## Usage

Each subproject has its own README and Terraform files. To run one:

```bash
cd <folder-name>
terraform init
terraform plan -var-file="terraform.tfvars"
terraform apply -var-file="terraform.tfvars"
