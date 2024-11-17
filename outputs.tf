output "start_ec2_rule_arn" {
  description = "ARN of the EventBridge rule for starting the EC2 instance"
  value       = aws_cloudwatch_event_rule.start_ec2_rule.arn
}

output "stop_ec2_rule_arn" {
  description = "ARN of the EventBridge rule for stopping the EC2 instance"
  value       = aws_cloudwatch_event_rule.stop_ec2_rule.arn
}
