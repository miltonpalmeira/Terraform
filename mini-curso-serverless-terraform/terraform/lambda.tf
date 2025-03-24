data "archive_file" "lambda_zip" {
  type = "zip"
  source_dir = "${path.module}/../src"
  output_path = "${path.module}/lambda_function.zip"
}

resource "aws_lambda_function" "lambda" {
  function_name = "lambda_function"
  role          = aws_iam_role.lambda_exec.arn
  handler       = "main.lambda_handler"
  runtime       = "python3.10"
  filename      = data.archive_file.lambda_zip.output_path
  source_code_hash = data.archive_file.lambda_zip.output_base64sha256
  timeout = 10
  memory_size = 128
}