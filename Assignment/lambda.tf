data "archive_file" "init" {
  type        = "zip"
  source_file = "script.py"
  output_path = "outputs/script.zip"
}

resource "aws_lambda_function" "s3_to_dynamodb_lambda" {
  filename      = "outputs/script.zip"
  function_name = var.lambda_function_name
  role          = aws_iam_role.Test_role.arn
  handler       = "script.s3_to_dynamodb"

  source_code_hash = filebase64sha256("outputs/script.zip")
  runtime = "python3.7"
}

resource "aws_lambda_permission" "allow_bucket" {
  statement_id  = "AllowExecutionFromS3Bucket"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.s3_to_dynamodb_lambda.arn
  principal     = "s3.amazonaws.com"
  source_arn    = aws_s3_bucket.csv_bucket.arn
}

resource "aws_s3_bucket_notification" "aws-lambda-trigger" {
  bucket = aws_s3_bucket.csv_bucket.bucket
  lambda_function {
    lambda_function_arn = aws_lambda_function.s3_to_dynamodb_lambda.arn
    events              = ["s3:ObjectCreated:*"]
    filter_suffix       = ".csv"
  }
}