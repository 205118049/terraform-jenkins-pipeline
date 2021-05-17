# This stack assumes that a Default VPC is present



resource "aws_instance" "webserver" {
  ami             = "ami-0bc8ae3ec8e338cbc"
  instance_type   = "t2.micro" 

}

resource "aws_security_group" "instance" {
  name = "test-sg"
  description = "Allow traffic for instances"

  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = [ "0.0.0.0/0" ]
  }

  ingress {
    protocol    = "tcp"
    from_port   = 80
    to_port     = 80
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port = 0
    to_port = 65535
    protocol = "tcp"
    cidr_blocks = [ "0.0.0.0/0" ]
  }
}