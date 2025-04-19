resource "aws_eip" "webeip" {
  instance = aws_instance.webvm.id
  domain   = "vpc"
  depends_on = [aws_instance.bastionhost, aws_vpc.thet-vpc]
}
resource "aws_eip" "web2eip" {
  instance = aws_instance.webvm2.id
  domain   = "vpc"
  depends_on = [aws_instance.webvm2, aws_vpc.thet-vpc]
}
resource "aws_eip" "myec2vmeip" {
  instance = aws_instance.bastionhost.id
  domain   = "vpc"
  depends_on = [aws_instance.webvm, aws_vpc.thet-vpc]
}
resource "aws_eip" "nateip" {
  domain   = "vpc"
}