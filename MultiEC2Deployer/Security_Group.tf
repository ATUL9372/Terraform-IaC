
///////////     NEW CONFIG    /////////////////


resource "aws_security_group" "server_1_security_group" {
  name        = "${var.sg_name}"
  description = "${var.sg_description}"
  dynamic "ingress" {
    for_each = var.ports  // call varibale && terraform.tfvars files
    iterator = port
    content {
      description = "TLS from VPC"
      from_port   = port.value
      to_port     = port.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

}


///////////    OLD  CONFIG   ////////////////////////


# resource "aws_security_group" "server_1_security_group" {
#   name        = "test_terraform_SG"
#   description = "this is test_terraform_SG Allow inbound traffic" 
  

#   ingress {
#     description      = "SSH port open for internet"
#     from_port        = 22
#     to_port          = 22
#     protocol         = "tcp"
#     cidr_blocks      = ["0.0.0.0/0"]
# }

#   ingress {
#     description      = "HTTP port open for internet"
#     from_port        = 80
#     to_port          = 80
#     protocol         = "tcp"
#     cidr_blocks      = ["0.0.0.0/0"]
# }

#   ingress {
#     description      = "HTTPS port open for internet"
#     from_port        = 443
#     to_port          = 443
#     protocol         = "tcp"
#     cidr_blocks      = ["0.0.0.0/0"]
# }

#   egress {
#     from_port        = 0
#     to_port          = 0
#     protocol         = "-1"
#     cidr_blocks      = ["0.0.0.0/0"]
#     ipv6_cidr_blocks = ["::/0"]
#   }

#   tags = {
#     Name = "test_terraform_SG"
#     Owner = "Atul"
#     CanBeDelete = "Yes"
#   }


# }
