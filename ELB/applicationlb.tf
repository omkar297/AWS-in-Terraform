resource "aws_lb" "testelb" {
  name = "testelb"
  internal = false
  load_balancer_type = "application"
  security_groups = [ "sg-042f7cb41b3b0f378" ]
  subnets = [ "subnet-0585d3bec5c23fbc4" , "subnet-0a5bf59c90a20e6da" , "subnet-0ba5f32b120dccb1e" ]
}
resource "aws_lb_listener" "test-aws_lb_listener" {
  load_balancer_arn = aws_lb.testelb.arn
  port = "80"
  protocol = "HTTP"
  default_action {
    type = "forward"
    target_group_arn = aws_lb_target_group.test-tg.arn
  }
}
resource "aws_lb_target_group" "test-tg" {
  name = "test-tg"
  port = 80
  protocol = "HTTP"
  vpc_id = "vpc-04929380d16a3f868"
  protocol_version = "HTTP1"
  ip_address_type = "ipv4"
}
resource "aws_lb_target_group_attachment" "test-aws_lb_target_group_attachment0" {
  target_group_arn = aws_lb_target_group.test-tg.arn
  target_id = aws_instance.test-linux[0].id
  port = 80
}
resource "aws_lb_target_group_attachment" "test-aws_lb_target_group_attachment1" {
  target_group_arn = aws_lb_target_group.test-tg.arn
  target_id = aws_instance.test-linux[1].id
  port = 80
}