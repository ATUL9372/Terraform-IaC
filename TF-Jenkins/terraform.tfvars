#// provider Config

region          = "ap-south-1"
access_key      = ""
secret_key      = ""

#// EC2 Instances (server) Config

server_name     = ""
server_ami      = "ami-07f07a6e1060cd2a8"
server_type     = ""
server_owner    = ""                // EC2 Tags
server_can_be_deleted = ""


#// storage

volume_type             = ""           //gp2, gp3, io1, io2, sc1, st1, standard
volume_storage_size     = "29"  
delete_on_termination   = "true"

#// SSH-Key Key Pair 

aws_create_key_pair_name = "atul_terraform_JK_KP"

#// user_data

user_data_script_file    = "./jenkins_installation.sh"

#// Security Group

aws_security_group_name  = ""
allowed_ports            = [22, 80, 443, 8080]