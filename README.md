for using this bucket as a terraform state use this code:

terraform {
  backend "s3"
    bucket = "terraform-up-and-running-state"
    key = "global/s3/terraform.tfstate"
    region = "us-east-2"
    
    # replce this with your dynamodb table name!
  dynamodb_table = "terraform-up-and-running-locks"
  encrypt = true
  }
}
