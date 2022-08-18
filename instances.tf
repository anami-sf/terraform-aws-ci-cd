resource "aws_instance" "instance_1" {
  ami             = data.aws_ami.ubuntu.id
  instance_type   = "t2.micro"
  key_name        = "admin-key-pair"
  associate_public_ip_address = true
  security_groups = [aws_security_group.instances.name]
  user_data       = <<-EOF
            #!/bin/bash
            echo "Hello, World 1" > index.html
            python3 -m http.server 8080 &
            EOF
}

resource "aws_instance" "instance_2" {
  ami             = data.aws_ami.ubuntu.id
  instance_type   = "t2.micro"
  key_name        = "admin-key-pair"
  associate_public_ip_address = true
  security_groups = [aws_security_group.instances.name]
  user_data       = <<-EOF
            #!/bin/bash
            echo "Hello, World 2" > index.html
            python3 -m http.server 8080 &
            EOF
}
