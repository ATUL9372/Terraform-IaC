resource "aws_instance" "jenkins_server" {
  ami = "${var.server_ami}"
  instance_type = "${var.server_type}"
  user_data = file("${var.user_data_script_file}")

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

resource "aws_key_pair" "own_ssh_key"{
    key_name = "${var.aws_create_key_pair_name}"
//    public_key = "${var.public_ssh_key}"
}

// RSA key of size 4096 bits
resource "tls_private_key" "" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_security_group" "local_security_group"{
    name = ""
}

// Default VPC 

resource "aws_default_vpc" "default_cloud_vpc" {
  tags = {
    Name = "Default VPC"
  }
}