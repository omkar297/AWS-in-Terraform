resource "aws_vpc" "test-aws_vpc" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "test-aws_vpc"
    env = "test"
    cidr ="10.0.0.0/16"
  }
}
resource "aws_internet_gateway" "test-aws_internet_gateway" {
  vpc_id = aws_vpc.test-aws_vpc.id

  tags = {
    Name = "test-aws_internet_gateway"
    env = "test"
    vpc = "test-aws_vpc"
  }
}
/*resource "aws_internet_gateway_attachment" "test-iga" {
  internet_gateway_id = aws_internet_gateway.test-aws_internet_gateway.id
  vpc_id = aws_vpc.test-aws_vpc.id
}*/
resource "aws_route_table" "test-route-table-public" {
  vpc_id = aws_vpc.test-aws_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.test-aws_internet_gateway.id
  }
  tags = {
    Name = "test-route-table-public"
    env = "test"
    type = "public"
  }
}
resource "aws_route_table" "test-route-table-private" {
  vpc_id = aws_vpc.test-aws_vpc.id
  tags = {
    Name = "test-route-table-private"
    env = "test"
    type = "private"
  }
}
resource "aws_subnet" "test-public" {
  vpc_id = aws_vpc.test-aws_vpc.id
  cidr_block = "10.0.1.0/24"
  map_public_ip_on_launch = null
  tags = {
    Name = "test-public"
    env = "test"
    type = "subnet"
  }
}
resource "aws_subnet" "test-private" {
  vpc_id = aws_vpc.test-aws_vpc.id
  cidr_block = "10.0.2.0/24"
  map_public_ip_on_launch = false
  tags = {
    Name = "test-private"
    env = "test"
    type = "subnet"
  }
}
resource "aws_route_table_association" "test-rta-public" {
  subnet_id = aws_subnet.test-public.id
  route_table_id = aws_route_table.test-route-table-public.id
}
resource "aws_route_table_association" "test-rta-private" {
  subnet_id = aws_subnet.test-private.id
  route_table_id = aws_route_table.test-route-table-private.id
}
resource "aws_security_group" "Net-1" {
  name = "Net-1"
  description = "allow all incoming traffic"
  vpc_id = aws_vpc.test-aws_vpc.id
  ingress = [
    {
      description      = "All traffic"
      from_port        = 0    # All ports
      to_port          = 0    # All Ports
      protocol         = "-1" # All traffic
      cidr_blocks      = ["0.0.0.0/0"]
      ipv6_cidr_blocks = null
      prefix_list_ids  = null
      security_groups  = null
      self             = null
    }
  ]

  egress = [
    {
      from_port        = 0
      to_port          = 0
      protocol         = "-1"
      cidr_blocks      = ["0.0.0.0/0"]
      ipv6_cidr_blocks = ["::/0"]
      description      = "Outbound rule"
      prefix_list_ids  = null
      security_groups  = null
      self             = null
    }
  ]

  tags = {
    Name = "Net-1"
    env = "test"
  }
}