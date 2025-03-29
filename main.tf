resource "aws_instance" "this" {
  ami           = "ami-026c39f4021df9abe"
  instance_type = "t2.micro"

  vpc_security_group_ids = [aws_security_group.this.id]

  user_data = file("${path.module}/user_data.sh")
  user_data_replace_on_change = true

  tags = {
    Name = "udemy-terraform-ec2"
  }
}

resource "aws_security_group" "this" {
  name = "udemy-terraform-ec2-sg"
}

resource "aws_security_group_rule" "ssh" {
  count = var.allow_ssh ? 1 : 0
  from_port         = 22
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.this.id
  to_port           = 22
  type              = "ingress"
}

resource "aws_security_group_rule" "http" {
  from_port         = 80
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.this.id
  to_port           = 80
  type              = "ingress"
}

resource "aws_security_group_rule" "egress" {
  from_port         = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.this.id
  to_port           = 0
  type              = "egress"
}