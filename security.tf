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