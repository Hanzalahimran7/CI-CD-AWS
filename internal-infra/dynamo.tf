resource "aws_dynamodb_table" "this" {
  name             = var.dynamo_db_name
  hash_key         = var.hash_key
  read_capacity = 1
  write_capacity = 1

  attribute {
    name = var.hash_key
    type = "S"
  }
}
