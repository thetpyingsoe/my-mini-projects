resource "aws_route_table" "app-route" {
  vpc_id = aws_vpc.thet-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat.id
  }
  tags = {
    Name = "Thet-app-route"
  }
}
resource "aws_route_table" "db-route" {
  vpc_id = aws_vpc.thet-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat.id
  }
  tags = {
    Name = "Thet-db-route"
  }
}
resource "aws_route_table" "pub-route" {
  vpc_id = aws_vpc.thet-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }
  tags = {
    Name = "Thet-pub-route"
  }
}
resource "aws_route_table_association" "app1" {
  subnet_id      = aws_subnet.app1.id
  route_table_id = aws_route_table.app-route.id
}
resource "aws_route_table_association" "db1" {
  subnet_id      = aws_subnet.db1.id
  route_table_id = aws_route_table.app-route.id
}
resource "aws_route_table_association" "app2" {
  subnet_id      = aws_subnet.app2.id
  route_table_id = aws_route_table.app-route.id
}
resource "aws_route_table_association" "db2" {
  subnet_id      = aws_subnet.db2.id
  route_table_id = aws_route_table.app-route.id
}
resource "aws_route_table_association" "pub" {
  subnet_id      = aws_subnet.pub1.id
  route_table_id = aws_route_table.pub-route.id
}
resource "aws_route_table_association" "pub2" {
  subnet_id      = aws_subnet.pub2.id
  route_table_id = aws_route_table.pub-route.id
}