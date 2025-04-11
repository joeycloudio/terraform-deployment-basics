#main.tf
resource "aws_s3_bucket" "my_bucket" {
  bucket = var.bucket_name
}

#variables.tf
variable "bucket_name" {
  type = string
}

#terraform.tfvars
bucket_name = "my-company-prod-logs"

#you run
terraform init
terraform apply -var-file="terraform.tfvars" # 👈 applies your infra using the values inside .tfvars, does not do assertions, does not destroy
