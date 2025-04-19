resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.thet-vpc.id

  tags = {
    Name = "thet-gw"
  }
}
resource "aws_nat_gateway" "nat" {
  allocation_id = aws_eip.nateip.id
  subnet_id     = aws_subnet.pub1.id

  tags = {
    Name = "Thet-NAT"
  }

  # To ensure proper ordering, it is recommended to add an explicit dependency
  # on the Internet Gateway for the VPC.
  depends_on = [aws_internet_gateway.gw]
}