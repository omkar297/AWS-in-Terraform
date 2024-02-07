resource "aws_efs_file_system" "test-aws_efs_file_system" {
  creation_token = "test-aws_efs_file_system"
  availability_zone_name = "ap-south-1a"
  lifecycle_policy {
    transition_to_ia = "AFTER_30_DAYS"
  }

  tags = {
    Name = "test-aws_efs_file_system"
    env = "test"
  }
}