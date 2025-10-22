output "server_private_ip" {
  description = "This is a server private ip address"
  value = aws_instance.jenkins_server.private_ip
}

output "server_public_ip" {
  description = "This is a server public ip address"
  value = aws_instance.jenkins_server.public_ip
}

# EC2 instance ID

output "jenkins_instance_id" {
  description = "Instance ID of the Jenkins server"
  value       = aws_instance.jenkins_server.id
}