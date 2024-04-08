resource "aws_instance" "jenkinsMastar" {
  instance_type = var.instance_type
  ami = "ami-007020fd9c84e18c7"
  key_name = var.key_name
  user_data = file("./script.sh")
  associate_public_ip_address = true
  tags = {
    Name = "Jenkins-Mastar"
    env = "test"
    os = "linux-ubuntu"
  }
}