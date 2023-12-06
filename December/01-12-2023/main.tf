provider "aws" {
  region = "us-east-1"
}

# Create a VPC
resource "aws_vpc" "my_vpc" {
  cidr_block = "10.0.0.0/16"
}

# Create a subnet within the VPC
resource "aws_subnet" "my_subnet" {
  vpc_id                  = aws_vpc.my_vpc.id
  cidr_block              = "10.0.1.0/24"
  availability_zone       = "us-east-1a"
}

# Create a security group
resource "aws_security_group" "my_security_group" {
  name        = "my-security-group"
  vpc_id = aws_vpc.my_vpc.id

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# Create an EC2 instance
resource "aws_instance" "my_instance" {
  ami           = "ami-0230bd60aa48260c6"
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.my_subnet.id
  key_name      = "Test"  

  vpc_security_group_ids = [aws_security_group.my_security_group.id]

  tags = {
    Name = "MyServer"
  }
}
