variable "start_lambda_arn" {
  description = "ARN of the Lambda function to start the EC2 instance"
  type        = string
}

variable "stop_lambda_arn" {
  description = "ARN of the Lambda function to stop the EC2 instance"
  type        = string
}

variable "start_schedule" {
  description = "Cron schedule for starting the EC2 instance (e.g., 10 AM UTC)"
  type        = string
  default     = "cron(0 10 * * ? *)" # 10 AM UTC
}

variable "stop_schedule" {
  description = "Cron schedule for stopping the EC2 instance (e.g., 9 PM UTC)"
  type        = string
  default     = "cron(0 21 * * ? *)" # 9 PM UTC
}
