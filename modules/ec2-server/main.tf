resource "aws_instance" "jenkins_server" {
  ami                    = var.server_ami
  instance_type          = var.server_type
  user_data              = file("${var.user_data_script_file}")
  key_name               = aws_key_pair.own_ssh_key.key_name
  vpc_security_group_ids = [aws_security_group.local_security_group.id]

  root_block_device {
    volume_type           = var.volume_type
    volume_size           = var.volume_storage_size
    delete_on_termination = var.delete_on_termination
  }

  tags = {
    Name         = "${var.server_name}"
    Owner        = "${var.server_owner}"
    CanBeDeleted = "${var.server_can_be_deleted}"
  }

}

// Default VPC 

resource "aws_default_vpc" "default_cloud_vpc" {
  tags = {
    Name = "Default VPC"
  }
}
