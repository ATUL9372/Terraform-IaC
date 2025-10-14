resource "aws_instance" "jenkins_server" {
  ami = "${var.server_ami}"
  instance_type = "${var.server_type}"
  user_data = file("${var.user_data_script_file}")
  key_name = aws_key_pair.own_ssh_key.key_name
  vpc_security_group_ids = [aws_security_group.local_security_group.id]

  root_block_device {
    volume_type = "${var.volume_type}"
    volume_size = "${var.volume_storage_size}"
    delete_on_termination = "${var.delete_on_termination}"
  }

  tags ={
    Name = "${var.server_name}"
    Owner = "${var.server_owner}"
    CanBeDeleted = "${var.server_can_be_deleted}"
  }  

}

// Default VPC 

resource "aws_default_vpc" "default_cloud_vpc" {
  tags = {
    Name = "Default VPC"
  }
}

// Create RSA key of size 4096 bits
resource "tls_private_key" "LTF_Key_Pair" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

// Save the private ssh key on local

resource "local_file" "LTF_private_key" {
  content = tls_private_key.LTF_Key_Pair.private_key_pem
  filename = "${path.module}/${var.aws_create_key_pair_name}.pem"
  file_permission = "0600"
}

// Upload public key to AWS 
resource "aws_key_pair" "own_ssh_key"{
    key_name = "${var.aws_create_key_pair_name}"
    public_key = "tls_private_key.LTF_Key_Pair.public_key_openssh"
}


resource "aws_security_group" "local_security_group"{
    name = "${var.aws_security_group_name}"
    description = "${var.aws_security_group_description}"

    // Setup for Inbound traffic (incoming to your instance) rules 

    dynamic "ingress" {
      for_each = var.allowed_ports
      content {
        from_port = ingress.value
        to_port = ingress.value
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
        description = "Allow TCP port ${ingress.value}"
      }
      
    }

    // Setup for Outbound traffic (outgoing from your instance) rules 

    egress {
      from_port = 0
      to_port = 0
      protocol = "-1"
      cidr_blocks = ["0.0.0.0/0"]
    }

    tags = {
      Name = "${var.server_owner}"
      CanBeDeleted = "${var.server_can_be_deleted}"
    }

}

