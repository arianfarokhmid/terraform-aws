## Terraform Setup

This project uses an S3 bucket for storing the Terraform state and a DynamoDB table for state locking. Before running Terraform, ensure you have the required AWS infrastructure (S3 bucket and DynamoDB table) set up. Below is the configuration you'll need to add to your Terraform files to use these services for remote state management.

```hcl
terraform {
  backend "s3" {
    bucket         = "terraform-up-and-running-state"
    key            = "global/s3/terraform.tfstate"
    region         = "us-east-2"
    
    # Replace this with your DynamoDB table name!
    dynamodb_table = "terraform-up-and-running-locks"
    encrypt        = true
  }
}

