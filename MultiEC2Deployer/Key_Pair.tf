resource "aws_key_pair" "key_pair_terraform" {
  key_name   = "${var.key_pair_name}"
  public_key = file("${path.module}${var.public_key_name}")
  
//  public_key = "${file("~/Documents/1_Terraform/AWS/key_pair_terraform.pub")}"
  tags = {
    Name = "${var.key_pair_name}"
    Owner = "${var.key_pair_tag_owner}"
    CanBeDelete = "${var.key_pair_tag_canbedelete}"

  }

  
}


