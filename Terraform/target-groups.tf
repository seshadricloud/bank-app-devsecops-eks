resource "aws_lb_target_group" "bankapp-tg" {
  name     = "BankApp-Target-Group"
  port     = 8080
  protocol = "HTTP"
  vpc_id   = aws_vpc.bankapp-vpc.id

  health_check {
    path                = "/login"  
    interval            = 30
    timeout             = 5
    healthy_threshold   = 3
    unhealthy_threshold = 2
    matcher             = "200" 
    port                = "traffic-port"
  }
}

resource "aws_lb_target_group_attachment" "bankapp-tg-attachment" {
  count            = length(aws_instance.Bankapp)
  target_group_arn = aws_lb_target_group.bankapp-tg.arn
  target_id        = aws_instance.Bankapp[count.index].id
  port             = 8080
}