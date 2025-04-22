##############################
# VPC & Subnets 
##############################

data "aws_vpc" "default" {
  default = true
}

resource "aws_vpc" "custom" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name   = "luna-db"
    Access = ""
  }
}

resource "aws_subnet" "private1" {
  vpc_id            = aws_vpc.custom.id
  availability_zone = "us-east-1a"

  cidr_block = "10.0.0.0/24"

  tags = {
    Name   = "subnet-custom-vpc-private1"
    Access = "private"
  }
}

resource "aws_subnet" "private2" {
  vpc_id            = aws_vpc.custom.id
  availability_zone = "us-east-1e"

  cidr_block = "10.0.1.0/24"

  tags = {
    Name   = "subnet-custom-vpc-private2"
    Access = "private"
  }
}

resource "aws_subnet" "public1" {
  vpc_id = aws_vpc.custom.id

  cidr_block = "10.0.2.0/24"

  tags = {
    Name = "subnet-custom-vpc-public1"
  }
}

##############################
# Security Groups
##############################

resource "aws_security_group" "source" {
  name        = "source-sg"
  description = "SG from which connections are allowed into DB."
  vpc_id      = aws_vpc.custom.id
}


resource "aws_security_group" "compliant" {
  name        = "compliant-sg"
  description = "Compliant security group."
  vpc_id      = aws_vpc.custom.id
}

resource "aws_vpc_security_group_ingress_rule" "db" {
  security_group_id            = aws_security_group.compliant.id
  referenced_security_group_id = aws_security_group.source.id
  from_port                    = 5432
  to_port                      = 5432
  ip_protocol                  = "tcp"
}


resource "aws_security_group" "non_compliant" {
  name        = "non-compliant-sg"
  description = "Non-compliant security group."
  vpc_id      = aws_vpc.custom.id
}

resource "aws_vpc_security_group_ingress_rule" "https" {
  security_group_id = aws_security_group.non_compliant.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 443
  to_port           = 443
  ip_protocol       = "tcp"
}

