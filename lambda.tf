
resource "aws_lambda_function" "signIn" {
  function_name = "lambda-customer-signin"
  role          = "arn:aws:iam::528038094654:role/LabRole"
  handler       = "index.handler"
  runtime       = "nodejs18.x"
  timeout          = 30
  filename      = "${path.module}/lambda-customer-signin.zip"

  source_code_hash = filebase64sha256("${path.module}/lambda-customer-signin.zip")

   environment {
    variables = {
      AWS_COGNITO_REGION  = var.aws_region
      AWS_COGNITO_USER_POOL_ID = aws_cognito_user_pool.tech-challenge_admin_pool.id
      AWS_COGNITO_CLIENT_ID = aws_cognito_user_pool_client.tech-challenge_client.id
    }
  }

  depends_on = [
    aws_cognito_user_pool.tech-challenge_admin_pool,
    aws_cognito_user_pool_client.tech-challenge_client
  ]
}

resource "aws_lambda_function" "signUp" {
  function_name = "lambda-customer-signup"
  role          = "arn:aws:iam::528038094654:role/LabRole"
  handler       = "index.handler"
  runtime       = "nodejs18.x"
  timeout          = 30
  filename      = "${path.module}/lambda-customer-signup.zip"

  source_code_hash = filebase64sha256("${path.module}/lambda-customer-signup.zip")

    environment {
    variables = {
      AWS_COGNITO_REGION  = var.aws_region
      AWS_COGNITO_USER_POOL_ID = aws_cognito_user_pool.tech-challenge_admin_pool.id
      AWS_COGNITO_CLIENT_ID = aws_cognito_user_pool_client.tech-challenge_client.id
    }
  }

  depends_on = [
    aws_cognito_user_pool.tech-challenge_admin_pool,
    aws_cognito_user_pool_client.tech-challenge_client
  ]
}

resource "aws_lambda_function" "authorizer" {
  function_name = "lambda-authorizer"
  role          = "arn:aws:iam::528038094654:role/LabRole"
  handler       = "index.handler"
  runtime       = "nodejs18.x"
  timeout          = 30
  filename      = "${path.module}/lambda-authorizer.zip"

  source_code_hash = filebase64sha256("${path.module}/lambda-authorizer.zip")

    environment {
    variables = {
      AWS_COGNITO_REGION  = var.aws_region
      AWS_COGNITO_USER_POOL_ID = aws_cognito_user_pool.tech-challenge_admin_pool.id
      AWS_COGNITO_CLIENT_ID = aws_cognito_user_pool_client.tech-challenge_client.id
    }
  }

  depends_on = [
    aws_cognito_user_pool.tech-challenge_admin_pool,
    aws_cognito_user_pool_client.tech-challenge_client
  ]
}


resource "aws_lambda_function" "administrative" {
  function_name = "lambda-administrative"
  role          = "arn:aws:iam::528038094654:role/LabRole"
  handler       = "index.handler"
  runtime       = "nodejs18.x"
  timeout          = 30
  filename      = "${path.module}/lambda-administrative.zip"

  source_code_hash = filebase64sha256("${path.module}/lambda-administrative.zip")

    environment {
    variables = {
      AWS_COGNITO_REGION  = var.aws_region
      AWS_COGNITO_USER_POOL_ID = aws_cognito_user_pool.tech-challenge_admin_pool.id
      AWS_COGNITO_CLIENT_ID = aws_cognito_user_pool_client.tech-challenge_client.id
    }
  }

  depends_on = [
    aws_cognito_user_pool.tech-challenge_admin_pool,
    aws_cognito_user_pool_client.tech-challenge_client
  ]
}


output "lambda_arns" {
  value = [
    aws_lambda_function.signIn.arn,
    aws_lambda_function.signUp.arn,
    aws_lambda_function.authorizer.arn,
    aws_lambda_function.administrative.arn
  ]
}
