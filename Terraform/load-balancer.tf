resource "aws_lb" "Bankapp-lb" {
  name               = "BankApp-lb"
  internal           = false
  load_balancer_type = "application"
  subnets            = [aws_subnet.bankapp-public-subnet1.id, aws_subnet.bankapp-public-subnet2.id]
  security_groups    = [aws_security_group.bankapp-Security.id]
  tags = {
    Environment = "production"
  }
}


resource "aws_lb_listener" "BankApp-listener" {
  load_balancer_arn = aws_lb.Bankapp-lb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.bankapp-tg.arn
  }
}