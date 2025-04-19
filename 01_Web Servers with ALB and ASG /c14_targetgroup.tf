resource "aws_lb_target_group" "tg1" {
  name     = "thet-alb-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.thet-vpc.id
  depends_on = [aws_vpc.thet-vpc]
}
resource "aws_lb_target_group_attachment" "tga1" {
  target_group_arn = aws_lb_target_group.tg1.arn
  target_id        = aws_instance.webvm.id
  port             = 80
}
resource "aws_lb_target_group_attachment" "tga2" {
  target_group_arn = aws_lb_target_group.tg1.arn
  target_id        = aws_instance.webvm2.id
  port             = 80
}
