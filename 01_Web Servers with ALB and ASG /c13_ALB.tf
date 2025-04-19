resource "aws_lb" "thet-alb" {
  name               = "thet-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.albsg.id]
  subnets            = [aws_subnet.pub1.id, aws_subnet.pub2.id]
}
resource "aws_lb_listener" "front_end" {
  load_balancer_arn = aws_lb.thet-alb.arn
  port              = "80"
  protocol          = "HTTP"
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.tg1.arn
  }
}

