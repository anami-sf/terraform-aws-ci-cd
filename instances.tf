resource "aws_instance" "instance_1" {
  ami                         = data.aws_ami.ubuntu.id
  instance_type               = "t2.micro"
  key_name                    = "admin-key-pair"
  associate_public_ip_address = true
  security_groups             = [aws_security_group.instances.name]
}

resource "aws_instance" "instance_2" {
  ami                         = data.aws_ami.ubuntu.id
  instance_type               = "t2.micro"
  key_name                    = "admin-key-pair"
  associate_public_ip_address = true
  security_groups             = [aws_security_group.instances.name]
}
