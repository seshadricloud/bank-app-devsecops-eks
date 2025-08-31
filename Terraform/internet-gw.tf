# Creating Internet Gateway
resource "aws_internet_gateway" "bankapp-igw" {
  vpc_id = aws_vpc.bankapp-vpc.id

  tags = {
    Name = var.bankapp-igw
  }
}