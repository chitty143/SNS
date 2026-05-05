resource "aws_sns_topic" "topic" {
  name              = var.sns_topic_name
  display_name      = var.sns_display_name
  fifo_topic        = var.sns_fifo
  kms_master_key_id = var.kms_master_key_id
  tags              = var.sns_tags
}



###Example Access Policy allowing S3 bucket to publish#####
resource "aws_sns_topic_policy" "topic" {
  arn = aws_sns_topic.topic.arn
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect    = "Allow"
        Principal = "*"
        Action    = "SNS:Publish"
        Resource  = aws_sns_topic.topic.arn
        Condition = {
          ArnEquals = {
            "aws:SourceArn" = "arn:aws:s3:::my-bucket"
          }
        }
      }
    ]
  })
}

# Subscription
resource "aws_sns_topic_subscription" "email_sub" {
  topic_arn = aws_sns_topic.topic.arn
  protocol  = var.subscription_protocol
  endpoint  = var.subscription_endpoint
}

# Publish a message (using local-exec + AWS CLI)
resource "null_resource" "publish_message" {
  provisioner "local-exec" {
    command = "aws sns publish --topic-arn ${aws_sns_topic.topic.arn} --message \"Hello team, this is a test SNS notification from Terraform.\" --subject \"Test Notification\""
    interpreter = ["PowerShell", "-Command"]
  }
}


