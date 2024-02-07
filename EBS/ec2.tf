resource "aws_instance" "test-linux" {
  ami = "ami-03f4878755434977f"
  availability_zone = "ap-south-1a"
  instance_type = "t2.micro"

  tags = {
    Name = "test-linux"
    env = "test"
    os = "ubuntu"
  }
}