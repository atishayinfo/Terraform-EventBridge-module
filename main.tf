# EventBridge Rule for Starting EC2
resource "aws_cloudwatch_event_rule" "start_ec2_rule" {
  name                = "StartEC2Rule"
  description         = "Triggers the Lambda function to start the EC2 instance"
  schedule_expression = var.start_schedule
}

# EventBridge Target for Starting EC2
resource "aws_cloudwatch_event_target" "start_ec2_target" {
  rule      = aws_cloudwatch_event_rule.start_ec2_rule.name
  arn       = var.start_lambda_arn
}

# Permission for EventBridge to Trigger Start Lambda
resource "aws_lambda_permission" "allow_eventbridge_start" {
  statement_id  = "AllowEventBridgeToStartLambda"
  action        = "lambda:InvokeFunction"
  function_name = var.start_lambda_arn
  principal     = "events.amazonaws.com"
  source_arn    = aws_cloudwatch_event_rule.start_ec2_rule.arn
}

# EventBridge Rule for Stopping EC2
resource "aws_cloudwatch_event_rule" "stop_ec2_rule" {
  name                = "StopEC2Rule"
  description         = "Triggers the Lambda function to stop the EC2 instance"
  schedule_expression = var.stop_schedule
}

# EventBridge Target for Stopping EC2
resource "aws_cloudwatch_event_target" "stop_ec2_target" {
  rule      = aws_cloudwatch_event_rule.stop_ec2_rule.name
  arn       = var.stop_lambda_arn
}

# Permission for EventBridge to Trigger Stop Lambda
resource "aws_lambda_permission" "allow_eventbridge_stop" {
  statement_id  = "AllowEventBridgeToStopLambda"
  action        = "lambda:InvokeFunction"
  function_name = var.stop_lambda_arn
  principal     = "events.amazonaws.com"
  source_arn    = aws_cloudwatch_event_rule.stop_ec2_rule.arn
}
