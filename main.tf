provider "aws" {
  region = var.region
}

# VPC
resource "aws_vpc" "main_vpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "MainVPC"
  }
}

# Subnet
resource "aws_subnet" "public_subnet" {
  vpc_id     = aws_vpc.main_vpc.id
  cidr_block = "10.0.1.0/24"
  map_public_ip_on_launch = true
  tags = {
    Name = "PublicSubnet"
  }
}

# Internet Gateway
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main_vpc.id
  tags = {
    Name = "InternetGateway"
  }
}

# Route Table
resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.main_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "PublicRouteTable"
  }
}

# Route Table Association
resource "aws_route_table_association" "subnet_association" {
  subnet_id      = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.public_route_table.id
}

# Security Group
resource "aws_security_group" "web_sg" {
  vpc_id = aws_vpc.main_vpc.id

 tags = {
    Name = "WebSG"
  }

}

resource "aws_vpc_security_group_ingress_rule" "allow_ssh" {
    security_group_id = aws_security_group.web_sg.id
    from_port   = 22
    to_port     = 22
    ip_protocol    = "tcp"
    cidr_ipv4 = "0.0.0.0/0"
}

resource "aws_vpc_security_group_ingress_rule" "allow_http" {
    security_group_id = aws_security_group.web_sg.id
    from_port   = 80
    to_port     = 80
    ip_protocol    = "tcp"
    cidr_ipv4 = "0.0.0.0/0"
}

resource "aws_vpc_security_group_egress_rule" "allow_all_traffic" {
    security_group_id = aws_security_group.web_sg.id
    ip_protocol    = "-1"
    cidr_ipv4 = "0.0.0.0/0"
}


# EC2 Instance
resource "aws_instance" "web_server" {
  ami           = var.ami_id
  instance_type = var.instance_type
  subnet_id     = aws_subnet.public_subnet.id
  vpc_security_group_ids = [aws_security_group.web_sg.id]
  key_name = var.key_pair

  tags = {
    Name = "WebServerInstance"
  }
}