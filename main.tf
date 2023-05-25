provider "aws" {
  region = "us-east-1"
}

resource "aws_vpc" "app" {
  cidr_block = "10.0.0.0/16"
}

resource "aws_subnet" "app" {
  vpc_id     = aws_vpc.app.id
  cidr_block = "10.0.0.0/24"
}

resource "aws_security_group" "app" {
  name   = "app"
  vpc_id = aws_vpc.app.id

  ingress {
    from_port = 0
    to_port   = 0
    protocol  = "tcp"
  }

  egress {
    from_port = 0
    to_port   = 0
    protocol  = "tcp"
  }
}

resource "aws_instance" "app" {
  ami             = "ami-053b0d53c279acc90"
  instance_type   = "t2.micro"
  subnet_id       = aws_subnet.app.id
  security_groups = [aws_security_group.app.id]

  tags = {
    Name = "app"
  }

  associate_public_ip_address = true
}