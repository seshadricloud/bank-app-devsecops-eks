# Creating EC2 instance

resource "aws_instance" "Bankapp" {
  ami                         = "ami-04b4f1a9cf54c11d0"
  instance_type               = "t2.medium"
  count                       = 2
  key_name                    = aws_key_pair.deployer.key_name
  associate_public_ip_address = "true"
  vpc_security_group_ids      = [aws_security_group.bankapp-Security.id]
  subnet_id                   = aws_subnet.bankapp-public-subnet1.id
  user_data                   = file("C:\\Users\\MADHUP\\Desktop\\DEVOPS-BANKAPP\\Springboot-BankApp\\Terraform\\init.sh")
  tags = {
    Name = "BankApp"
  }
}
