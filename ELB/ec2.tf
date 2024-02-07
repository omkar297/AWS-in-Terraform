resource "aws_instance" "test-linux" {
  count = 2
  ami = "ami-03f4878755434977f"
  instance_type = "t2.micro"
  availability_zone = "ap-south-1a"

  tags = {
    Name = "test-linux"
    env = "test"
    os = "ubuntu"
  }
}