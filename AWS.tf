provider "aws" {
  region = "ap-south-1"  # Change this to your desired region
}

resource "aws_security_group" "allow_ssh" {
  name_prefix = "allow-ssh-"
  description = "Allow SSH access from the Internet"
  
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "example" {
  ami           = "ami-0f46fe83422d22a55"  # Replace this with your desired AMI ID
  instance_type = "t2.micro"               # Change this to your desired instance type
  security_groups = [aws_security_group.allow_ssh.id]
}
