variable "aws_region" {
  description = "Region where AWS Resoruces will be created"
  default = "ap-southeast-1"
}
variable "instance_type" {
  description = "EC2 instance type"
  default = "t3.micro"
}
variable "instance_keypair" {
  description = "AWS EC2 Keypair"
  default = "iamadminuat-kp"
}
variable "vpc_cidr" {
  description = "AWS VPC CIDR Block"
  default = "192.168.0.0/16"
}
variable "pub_subnet" {
  description = "Pbulic Subnets"
  default = ["192.168.0.0/24", "192.168.1.0/24"]
}
variable "app_subnet" {
  description = "Private Application Subnets"
  default = ["192.168.10.0/24", "192.168.11.0/24"]
}
variable "db_subnet" {
  description = "Private Database & Endpoints Subnet 1"
  default = ["192.168.20.0/24", "192.168.21.0/24"]
}
variable "availability_zone" {
  description = "Availability Zones"
  default = ["ap-southeast-1a","ap-southeast-1b"]
}


