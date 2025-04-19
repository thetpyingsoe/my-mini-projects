resource "aws_security_group" "websg" {
  name        = "allow websg traffic"
  description = "Allow web inbound traffic"
  vpc_id      = aws_vpc.thet-vpc.id

  ingress {
    description      = "HTTP from VPC"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    #cidr_blocks      = [aws_vpc.thet-vpc.cidr_block]
    cidr_blocks      = ["0.0.0.0/0"]
  }
  ingress {
    description      = "SSH from VPC"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    #cidr_blocks      = [aws_vpc.thet-vpc.cidr_block]
    cidr_blocks      = ["0.0.0.0/0"]
  }
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "websg"
  }
}
resource "aws_security_group" "clientsg" {
  name        = "allow clientsg traffic"
  description = "Allow cliens inbound traffic"
  vpc_id      = aws_vpc.thet-vpc.id

  ingress {
    description      = "RDP from VPC"
    from_port        = 3389
    to_port          = 3389
    protocol         = "tcp"
    #cidr_blocks      = [aws_vpc.thet-vpc.cidr_block]
    cidr_blocks      = ["0.0.0.0/0"]
  }
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "clientsg"
  }
}
#Create Security for Endpoint of SSM
resource "aws_security_group" "vpcepsg" {
  name        = "allow ssm traffic"
  description = "Allow ssm inbound traffic"
  vpc_id      = aws_vpc.thet-vpc.id

  ingress {
    description      = "ssm from VPC"
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks      = [aws_vpc.thet-vpc.cidr_block]
    #cidr_blocks      = ["0.0.0.0/0"]
  }
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "vpcepsg"
  }
}
#Create Security Group for ALB
resource "aws_security_group" "albsg" {
  name        = "allow web traffic"
  description = "Allow web inbound traffic to ALB"
  vpc_id      = aws_vpc.thet-vpc.id

  ingress {
    description      = "HTTP from VPC"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    #cidr_blocks      = [aws_vpc.thet-vpc.cidr_block]
    cidr_blocks      = ["0.0.0.0/0"]
  }
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "albsg"
  }
}