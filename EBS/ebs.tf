resource "aws_ebs_volume" "test-ebsvolume" {
  availability_zone = "ap-south-1a"
  size = 10

  tags = {
    Name = "test-ebsvolume"
    size = "10"
    env = "test"
  }
}
resource "aws_volume_attachment" "test-aws_volume_attachment" {
  device_name = "/dev/sdh"
  volume_id = aws_ebs_volume.test-ebsvolume.id
  instance_id = aws_instance.test-linux.id
}
