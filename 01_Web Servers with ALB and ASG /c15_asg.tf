resource "aws_launch_template" "thet-launch" {
  name_prefix   = "thet-launctp"
  image_id      = data.aws_ami.amzlinux2.id
  instance_type = var.instance_type
  #user_data = file("${path.module}/user_data_webvm2.sh")
  user_data = filebase64("${path.module}/user_data_webvm2.sh")
}

resource "aws_autoscaling_group" "thet-asg1" {
  #availability_zones = [var.availability_zone[0], var.availability_zone[1]]
  desired_capacity   = 1
  max_size           = 1
  min_size           = 1
  depends_on         = [aws_lb.thet-alb]
  vpc_zone_identifier = [aws_subnet.pub1.id, aws_subnet.pub2.id]
  ignore_failed_scaling_activities = "true"
  launch_template {
    id      = aws_launch_template.thet-launch.id
    version = aws_launch_template.thet-launch.latest_version
  }
}
# Create a new ALB Target Group attachment
resource "aws_autoscaling_attachment" "asg-atm1" {
  autoscaling_group_name = aws_autoscaling_group.thet-asg1.id
  lb_target_group_arn    = aws_lb_target_group.tg1.arn
}
