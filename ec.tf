

//creating aws instance

resource "aws_instance" "web-instance" {
  ami           = "ami-0bc8ae3ec8e338cbc" # ap-northeast-1
  instance_type = "t2.micro"

  tags = {
    Name = "web-server"
  }
}