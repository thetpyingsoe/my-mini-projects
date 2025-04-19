output "vpc-id" {
  description = "Custom VPC ID"
  value = aws_vpc.thet-vpc.id
}
output "igw-id" {
  description = "Internet Gateway ID"
  value = aws_internet_gateway.gw.id
}
output "nat-id" {
  description = "NAT Gateway ID"
  value = aws_nat_gateway.nat.id
}
/*output "webeip" {
  description = "Web Server elastic IP"
  value = aws_eip.webeip.public_ip
}
*/
output "myec2vmeip" {
  description = "Bastion Host elastic IP"
  value = aws_eip.myec2vmeip.public_ip
}
output "albdns" {
  description = "DNS name of ALB"
  value = aws_lb.thet-alb.dns_name
}