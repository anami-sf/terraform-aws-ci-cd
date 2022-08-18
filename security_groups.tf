resource "aws_security_group" "instances" {
  name = "instance-security-group"
}

resource "aws_security_group_rule" "allow_http_inbound" {
  type              = "ingress"
  security_group_id = aws_security_group.instances.id

  from_port   = 80
  to_port     = 80
  protocol    = "tcp"
  cidr_blocks = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "server_1_admin_ssh" {
  security_group_id = aws_security_group.instances.id
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  description       = "SSH access within network"
}

resource "aws_security_group_rule" "allow_intance_all_outbound" {
  security_group_id = aws_security_group.instances.id
  type              = "egress"

  protocol    = "-1"
  from_port   = 0
  to_port     = 0
  cidr_blocks = ["0.0.0.0/0"]
}

resource "aws_security_group" "alb" {
  name = "alb_securtiy_group"
}

resource "aws_security_group_rule" "allow_alb_http_inbound" {
  security_group_id = aws_security_group.alb.id
  type              = "ingress"

  protocol    = "tcp"
  to_port     = "80"
  from_port   = "80"
  cidr_blocks = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "allow_alb_all_outbound" {
  security_group_id = aws_security_group.alb.id
  type              = "egress"

  protocol    = "-1"
  from_port   = 0
  to_port     = 0
  cidr_blocks = ["0.0.0.0/0"]
}
