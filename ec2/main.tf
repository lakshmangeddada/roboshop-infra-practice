data "aws_ami" "ami" {
  most_recent = true
  name_regex = "Centos-8-DevOps-Practice"
  owners = ["973714476881"]
}


resource "aws_instance" "instance" {
  ami = data.aws_ami.ami.image_id
  instance_type = var.instance_type
  vpc_security_group_ids = [ aws_security_group.sg.id ]
  tags = {
    Name = var.component
  }
}

resource "null_resource" "provisioner" {
  provisioner "remote-exec" {

    connection {
      host     = aws_instance.instance.public_ip
      user     = "centos"
      password = "DevOps321"
    }

    inline = [
      "git clone https://github.com/lakshmangeddada/roboshop-shell.git",
      "cd roboshop-shell",
      "sudo bash ${var.component}.sh"
    ]
  }
}


resource "aws_route53_record" "record" {
  zone_id = "Z10202231Q9C3TKFTZOQE"
  name    = "${var.component}-${var.env}.devops71.tech"
  type    = "A"
  ttl     = 30
  records = [aws_instance.instance.private_ip]
}



resource "aws_security_group" "sg" {
  name        = "${var.component}-${var.env}-sg"
  description = "All"

  ingress {
    description      = "ALL"
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.component}-${var.env}-sg"
  }
}


variable "component" {}
variable "instance_type" {}
variable "env" {
  default = "dev"
}

