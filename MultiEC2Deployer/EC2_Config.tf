resource "aws_instance" "server1" {
  ami           = "${var.image_id_ami}"   // call variable &&   // Enter AMI ID
  instance_type = "${var.instance_type}"  // call variable &&             // Enter instances_type linke t2.micro, t3.medium etc.

  key_name = "${aws_key_pair.key_pair_terraform.key_name}"   // Call key-pair name like add this key on server1 (test_1_terraform)

  security_groups = ["${var.sg_name}"]

  tags = {                     // Instances tags
    Name = "${var.instance_name}"   // Enter Instances Name
    Owner = "${var.instance_owner_tag}"
    CanBeDelete = "${var.instance_canbedelete_tag}"
  }
 
}
