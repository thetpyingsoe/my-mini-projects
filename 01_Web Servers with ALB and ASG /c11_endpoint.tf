locals {
  endpoints = {
    "endpoint-ssm" = {
      name = "ssm"
    },
    "endpoint-ssmm-essages" = {
      name = "ssmmessages"
    },
    "endpoint-ec2-messages" = {
      name = "ec2messages"
    }
  }
}

resource "aws_vpc_endpoint" "endpoints" {
  vpc_id            = aws_vpc.thet-vpc.id
  for_each          = local.endpoints
  vpc_endpoint_type = "Interface"
  service_name      = "com.amazonaws.${var.aws_region}.${each.value.name}"
  # Add a security group to the VPC endpoint
  security_group_ids = [aws_security_group.vpcepsg.id]
}
resource "aws_vpc_endpoint" "s3" {
  vpc_id       = aws_vpc.thet-vpc.id
  service_name = "com.amazonaws.${var.aws_region}.s3"
}
resource "aws_vpc_endpoint_route_table_association" "endroute1" {
  route_table_id  = aws_route_table.app-route.id
  vpc_endpoint_id = aws_vpc_endpoint.s3.id
}
resource "aws_vpc_endpoint_route_table_association" "endroute2" {
  route_table_id  = aws_route_table.db-route.id
  vpc_endpoint_id = aws_vpc_endpoint.s3.id
}

/*resource "aws_vpc_endpoint" "ec2" {
  vpc_id            = aws_vpc.main.id
  service_name      = "com.amazonaws.us-west-2.ec2"
  vpc_endpoint_type = "Interface"

  security_group_ids = [
    aws_security_group.sg1.id,
  ]

  private_dns_enabled = true
}
*/