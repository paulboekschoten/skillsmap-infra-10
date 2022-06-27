# security groups
resource "aws_security_group" "private" {
  vpc_id = aws_vpc.main.id
  name   = "${var.name_tag}-private"
  tags = {
    Name = "${var.name_tag}-private"
  }
}

resource "aws_security_group" "public" {
  vpc_id = aws_vpc.main.id
  name   = "${var.name_tag}-public"
  tags = {
    Name = "${var.name_tag}-public"
  }
}

