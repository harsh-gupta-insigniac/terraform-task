variable "s3_bucket_name" {
  default = "csv-test-bucket-dv4d8b982"
}

variable "lambda_function_name" {
  default = "s3_to_dynamodb"
}

variable "region" {
  default = "eu-west-1"
}

variable "shared_credentials_file" {
  default = ""
}

variable "profile" {
  default = ""
}