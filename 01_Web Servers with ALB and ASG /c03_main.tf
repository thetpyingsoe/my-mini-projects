resource "aws_vpc" "thet-vpc" {
  cidr_block       = var.vpc_cidr
  instance_tenancy = "default"
  enable_dns_hostnames = true
  enable_dns_support   = true
  tags = {
    Name = "thet-vpc"
  }
}
resource "aws_subnet" "pub1" {
  vpc_id     = aws_vpc.thet-vpc.id
  cidr_block = var.pub_subnet[0]
  availability_zone = var.availability_zone[0]

  tags = {
    Name = "thet-pub1"
  }
}
resource "aws_subnet" "pub2" {
  vpc_id     = aws_vpc.thet-vpc.id
  cidr_block = var.pub_subnet[1]
  availability_zone = var.availability_zone[1]
  tags = {
    Name = "thet-pub2"
  }
}
resource "aws_subnet" "app1" {
  vpc_id     = aws_vpc.thet-vpc.id
  cidr_block = var.app_subnet[0]
  availability_zone = var.availability_zone[0]

  tags = {
    Name = "thet-app1"
  }
}
resource "aws_subnet" "app2" {
  vpc_id     = aws_vpc.thet-vpc.id
  cidr_block = var.app_subnet[1]
  availability_zone = var.availability_zone[1]

  tags = {
    Name = "thet-app2"
  }
}
resource "aws_subnet" "db1" {
  vpc_id     = aws_vpc.thet-vpc.id
  cidr_block = var.db_subnet[0]
  availability_zone = var.availability_zone[0]
  tags = {
    Name = "thet-db1"
  }
}
resource "aws_subnet" "db2" {
  vpc_id     = aws_vpc.thet-vpc.id
  cidr_block = var.db_subnet[1]
  availability_zone = var.availability_zone[1]
  tags = {
    Name = "thet-db2"
  }
}
