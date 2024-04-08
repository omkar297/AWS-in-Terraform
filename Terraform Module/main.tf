module "aws_ec2" {
  source = "terraform-aws-instance/ec2"
  ami = "ami-03f4878755434977f"
  instance_type = "t2.micro"
  key_name = var.key_name
  tags = {
    name = "linux-practic"
    env = "practic"
    type = "linux"
  }
}