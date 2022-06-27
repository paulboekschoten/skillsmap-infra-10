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

# security group rules
# ingress public http
resource "aws_security_group_rule" "public-ingress-http" {
  type              = "ingress"
  security_group_id = aws_security_group.public.id

  from_port   = var.http_port
  to_port     = var.http_port
  protocol    = local.tcp_protocol
  cidr_blocks = [local.all_ips]
}

# ingress public https
resource "aws_security_group_rule" "public-ingress-https" {
  type              = "ingress"
  security_group_id = aws_security_group.public.id

  from_port   = var.https_port
  to_port     = var.https_port
  protocol    = local.tcp_protocol
  cidr_blocks = [local.all_ips]
}

# ingress private sg
resource "aws_security_group_rule" "private-ingress-sg" {
  type              = "ingress"
  security_group_id = aws_security_group.private.id

  from_port                = var.http_port
  to_port                  = var.http_port
  protocol                 = local.tcp_protocol
  source_security_group_id = aws_security_group.public.id
}

# egress public all
resource "aws_security_group_rule" "public-egress-all" {
  type              = "egress"
  security_group_id = aws_security_group.public.id

  from_port   = local.any_port
  to_port     = local.any_port
  protocol    = local.any_protocol
  cidr_blocks = [local.all_ips]
}

# egress private all
resource "aws_security_group_rule" "private-egress-all" {
  type              = "egress"
  security_group_id = aws_security_group.private.id

  from_port   = local.any_port
  to_port     = local.any_port
  protocol    = local.any_protocol
  cidr_blocks = [local.all_ips]
}

# route tables
# default, add internet gateway
resource "aws_default_route_table" "default" {
  default_route_table_id = aws_vpc.main.default_route_table_id

  route {
    cidr_block = local.all_ips
    gateway_id = aws_internet_gateway.gw.id
  }

  tags = {
    Name = var.name_tag
  }
}

# route table for nat
resource "aws_route_table" "nat" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block     = local.all_ips
    nat_gateway_id = aws_nat_gateway.nat.id
  }

  tags = {
    Name = var.name_tag
  }
}

# associate nat route table with subnet
resource "aws_route_table_association" "nat" {
  subnet_id      = aws_subnet.private.id
  route_table_id = aws_route_table.nat.id
}