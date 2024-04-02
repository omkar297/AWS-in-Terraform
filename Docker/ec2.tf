resource "aws_instance" "test-linux" {
  ami = "ami-03f4878755434977f"
  instance_type = var.instance_type
  key_name = var.key_name
  associate_public_ip_address = true
  user_data = file("./script.sh")
  tags = {
    Name = "test-linux"
    env = "test"
    os = "linux-ubuntu"
  }
}