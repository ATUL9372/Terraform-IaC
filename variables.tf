// provider Config

variable "region" {
  type = string
  default = "ap-south-1"
  description = "Default region is mumbai"
}

variable "access_key" {
  type = string
}

variable "secret_key" {
  type = string
}

// AWS EC2 Instances Config

variable "server_ami" {
  type = string
  default = "ami-00cd1596c62928384"
  description = "This ami is ubuntu 24.04"
}

variable "server_type" {
  type = string
  default = "t2.micro"
  description = "Instance config default is 
  vCPU: 1 and RAM: 1"

}

variable "server_name"{
  type = string
  default = "demo_server_terra"
  description = "Default server name"
}

variable "server_owner"{
  type = string
  default = "atul_terraform"

}

variable "server_can_be_deleted"{
  type = string
  default = "Ask Owner"

}

// user_data

variable "user_data_script_file"{
  type = string
  description = "Put your custom bash script file"

}


// storage config


variable "volume_type"{
  type = string
  default = "gp2"
}

variable "volume_storage_size"{
  type = string
  default = "29"
}

variable "delete_on_termination"{
  type = string
  default = "true"
}

// AWS Key Pair

variable "aws_create_key_pair_name"{
  type = string
  default = "atul_terraform_KP"
}

//variable "public_ssh_key"{
//  type = string
//}


// Security group

variable ""{
  type = string
}

variable ""{
  type = string
}

variable ""{
  type = string
}


// Security group

