variable "sns_topic_name" {
  description = "Name of the SNS topic"
  type        = string
  default     = "my-first-topic"
}

variable "sns_display_name" {
  description = "Display name for the SNS topic"
  type        = string
  default     = "my-sns-topic"
}

variable "sns_fifo" {
  description = "Whether the topic is FIFO"
  type        = bool
  default     = false
}

variable "kms_master_key_id" {
  description = "KMS key ARN for encryption"
  type        = string
  default     = null
}

variable "sns_tags" {
  description = "Tags to apply to the SNS topic"
  type        = map(string)
  default = {
    Environment = "dev"
    Owner       = "team"
  }
}

variable "aws_region" {
  type    = string
  default = "ap-south-2"
}

variable "subscription_protocol" {
  description = "Protocol for the subscription (email, sqs, lambda, etc.)"
  type        = string
  default = "email"
}

variable "subscription_endpoint" {
  description = "Endpoint for the subscription (email address, SQS ARN, Lambda ARN, etc.)"
  type        = string
  default = "k.sivasankar.eee@gmail.com"
}

variable "publish_message" {
  description = "Message to publish to the SNS topic"
  type        = string
  default = "Hello team, this is a test SNS notification from Terraform."
}

variable "publish_subject" {
  description = "Subject of the published message"
  type        = string
  default     = "Test Notification"
}