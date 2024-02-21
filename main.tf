# main.tf



# Create an AWS Lambda function
resource "aws_lambda_function" "go_lambda_function" {
  function_name    = "go-lambda-function"
  runtime          = "go1.x"
  handler          = "main"
  filename         = "deployment.zip"
  source_code_hash = filebase64("main.zip")
  role             = aws_iam_role.lambda_role.arn

  # Define environment variables for the Lambda function
  environment {
    variables = {
      PSM_TABLE_NAME                     = module.psm_table.psm_table_name
      PSM_ROLLOUT_PERCENTAGES_TABLE_NAME = module.psm_rollout_percentages_table.psm_rollout_percentages_table_name
      PAC_TABLE_NAME                     = module.pac_table.pac_table_name
    }
  }
}

# Create an IAM role for the Lambda function
resource "aws_iam_role" "lambda_role" {
  name = "lambda_execution_role"

  # Attach a trust policy that allows Lambda to assume this role
  assume_role_policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Action" : "sts:AssumeRole",
        "Effect" : "Allow",
        "Principal" : {
          "Service" : "lambda.amazonaws.com"
        }
      }
    ]
  })
}

# Attach the AWSLambdaBasicExecutionRole policy to the IAM role
resource "aws_iam_policy_attachment" "lambda_execution_policy_attachment" {
  name       = "lambda_execution_attachment"
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
  roles      = [aws_iam_role.lambda_role.name]
}

# Create DynamoDB tables
module "psm_table" {
  source = "./modules/psm_table"
}

module "psm_rollout_percentages_table" {
  source = "./modules/psm_rollout_percentages_table"
}

module "pac_table" {
  source = "./modules/pac_table"
}