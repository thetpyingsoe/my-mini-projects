
# Mini-Projects of AWS Infrastructure with Terraform

Creating AWS Infrastructure using Terrafrom like AWS VPC,Subnets, IGW, NAT, Route Tables, Routes, Security Groups, EC2 Instances, Elastic IP, ALB, ASG, Endpoints, S3, SNS  Gaining Hands-on experiences in provising, managing and scaling.

![Alt text](02_Diagram.png)

Need to fix SSM role to WebVM and WinVM.
Need to fix ASG and Target Group and test notifications once activate.

## Task -01: Creating a provider and terrafrom version file

A provider in Terraform is a plugin that enables interaction with an API.
In this mini-projects, I am using the 5.24.0 version and region is ap-southeast.

## Terrafrom codes

```javascript
terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.24.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}
```

## Task-02: Creating VPC with CIDR 192.168.0.0/16

Creating VPC named "thet-vpc" with CIDR 192.168.0.0/16 which is declared by variable 

```javascript
resource "aws_vpc" "thet-vpc" {
  cidr_block       = var.vpc_cidr
  instance_tenancy = "default"
  enable_dns_hostnames = true
  enable_dns_support   = true
  tags = {
    Name = "thet-vpc"
  }
}
```
Variable:

```javascript
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
  default = "terraform"
}
variable "vpc_cidr" {
  description = "AWS VPC CIDR Block"
  default = "192.168.0.0/16"

}
variable "pub_subnet1" {
  description = "Pbulic Subnet 1"
  default = "192.168.0.0/24"
}
variable "pub_subnet2" {
  description = "Pbulic Subnet 2"
  default = "192.168.2.0/24"
}
variable "priv_subnet1" {
  description = "Private Subnet 1"
  default = "192.168.1.0/24"
}
variable "priv_subnet2" {
  description = "Private Subnet 2"
  default = "192.168.3.0/24"
}
variable "availability_zone" {
  description = "Availability Zones"
  default = ["ap-southeast-1a","ap-southeast-1b"]
}
```