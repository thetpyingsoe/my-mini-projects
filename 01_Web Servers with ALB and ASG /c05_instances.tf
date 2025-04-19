resource "aws_instance" "bastionhost" {
  ami = data.aws_ami.windows.id
  instance_type = var.instance_type
  key_name = var.instance_keypair
  vpc_security_group_ids = [aws_security_group.clientsg.id]
  availability_zone = var.availability_zone[0]
  subnet_id = aws_subnet.pub1.id
  iam_instance_profile = aws_iam_instance_profile.ec2_instance_profile.name
  tags = {
    "Name" = "thet-bastionhost"
  }
}
resource "aws_instance" "webvm" {
  ami                    = data.aws_ami.amzlinux2.id
  instance_type          = var.instance_type
  key_name               = var.instance_keypair
  vpc_security_group_ids = [aws_security_group.websg.id]
  availability_zone = var.availability_zone[0]
  subnet_id = aws_subnet.pub1.id
  iam_instance_profile = aws_iam_instance_profile.ec2_instance_profile.name
  user_data = file("${path.module}/user_data_webvm1.sh")
  tags = {
    "Name" = "thet-webvm"
}
}
resource "aws_instance" "webvm2" {
  ami                    = data.aws_ami.amzlinux2.id
  instance_type          = var.instance_type
  key_name               = var.instance_keypair
  vpc_security_group_ids = [aws_security_group.websg.id]
  availability_zone = var.availability_zone[1]
  subnet_id = aws_subnet.pub2.id
  iam_instance_profile = aws_iam_instance_profile.ec2_instance_profile.name
  user_data = file("${path.module}/user_data_webvm2.sh")
  tags = {
    "Name" = "thet-webvm2"
}
}
resource "aws_instance" "linuxvm" {
  #ami                    = data.aws_ami.amzlinux2.id
  ami                    = "ami-02ee2da448f4dfc47"
  instance_type          = var.instance_type
  #key_name              = var.instance_keypair
  vpc_security_group_ids = [aws_security_group.websg.id]
  availability_zone = var.availability_zone[0]
  subnet_id = aws_subnet.app1.id
  #Attach instance profile for SSM 
  iam_instance_profile = aws_iam_instance_profile.ec2_instance_profile.name
  tags = {
    "Name" = "thet-clientlinuxvm"
}
}
resource "aws_instance" "winvm" {
  ami                    = data.aws_ami.windows.id
  instance_type          = var.instance_type
  key_name              = var.instance_keypair
  vpc_security_group_ids = [aws_security_group.websg.id]
  availability_zone = var.availability_zone[1]
  subnet_id = aws_subnet.app2.id
  iam_instance_profile = aws_iam_instance_profile.ec2_instance_profile.name
  tags = {
    "Name" = "thet-clientwinvm"
}
}



