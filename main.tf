# Networking for Project Zibah

resource "aws_vpc" "Peniel-VPC" {

  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "Peniel-VPC "
  }
}
# Public Subnet

resource "aws_subnet" "Peniel-pub-subnet" {
  vpc_id     = aws_vpc.Peniel-VPC.id
  cidr_block = "10.0.100.0/24"
availability_zone = "eu-west-2a"

  tags = {
    Name = "Peniel-pub-subnet"
  }
}

# Private Subnet

resource "aws_subnet" "Peniel-priv-subnet" {
  vpc_id     = aws_vpc.Peniel-VPC.id
  cidr_block = "10.0.150.0/24"
availability_zone = "eu-west-2b"

  tags = {
    Name = "Peniel-priv-subnet"
  }
}



# Public RT

resource "aws_route_table" "Peniel-pub-RT" {
  vpc_id = aws_vpc.Peniel-VPC.id

  tags = {
    Name = "Peniel-pub-RT"
  }
}

# Associte public subnet to public RT

resource "aws_route_table_association" "Peniel-RT-Assoc-to-Pub-subnet" {
  subnet_id      = aws_subnet.Peniel-pub-subnet.id
  route_table_id = aws_route_table.Peniel-pub-RT.id
}


# Private RT

resource "aws_route_table" "Peniel-priv-RT" {
  vpc_id = aws_vpc.Peniel-VPC.id

  tags = {
    Name = "Peniel-priv-RT"
  }
}

# Associate Private subnet to Private RT

resource "aws_route_table_association" "Peniel-RT-Assoc-to-Priv-subnet" {
  subnet_id      = aws_subnet.Peniel-priv-subnet.id
  route_table_id = aws_route_table.Peniel-priv-RT.id
}
