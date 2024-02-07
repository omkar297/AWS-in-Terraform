resource "aws_instance" "linux-practic" {
  ami = "ami-03f4878755434977f"
  instance_type = "t2.micro"
  key_name = "0mK4r"
  tags = {
    name = "linux-practic"
    env = "practic"
    type = "linux"
  }
}
resource "aws_network_interface_sg_attachment" "sg_attachment"  {
  security_group_id = "sg-042f7cb41b3b0f378"
  network_interface_id = aws_instance.linux-practic.primary_network_interface_id
}