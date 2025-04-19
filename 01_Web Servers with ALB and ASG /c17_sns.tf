resource "aws_sns_topic" "asg-sns-topic" {
  name = "thet-asg-sns-topic"
}
resource "aws_sns_topic_subscription" "asg-sns-topic-sub" {
  topic_arn = aws_sns_topic.asg-sns-topic.arn
  protocol  = "email"
  endpoint  = "mgthetpinesoe@gmail.com"
}
resource "aws_autoscaling_notification" "asg-sns-noti" {
  group_names = [
    aws_autoscaling_group.thet-asg1.name,
  ]
  notifications = [
    "autoscaling:EC2_INSTANCE_LAUNCH",
    "autoscaling:EC2_INSTANCE_TERMINATE",
    "autoscaling:EC2_INSTANCE_LAUNCH_ERROR",
    "autoscaling:EC2_INSTANCE_TERMINATE_ERROR",
  ]

  topic_arn = aws_sns_topic.asg-sns-topic.arn
}
