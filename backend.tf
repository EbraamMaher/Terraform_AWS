terraform {

  backend "s3" {
    bucket = "lab1-tfstat"
    key    = "terraform.tfstate"
    region = "us-east-1"
    #dynamodb_table="demo"

  }

}
