resource "aws_dynamodb_table" "basic-dynamodb-table" {
  name           = "dynamodb-test"
  read_capacity  = 5
  write_capacity = 5
  hash_key       = "country"

  attribute {
    name = "country"
    type = "S"
  }
}