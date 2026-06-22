output "server_ip" {
  value = aws_instance.app_server.public_ip
}

output "server_url" {
  value = "http://${aws_instance.app_server.public_ip}:3000"
}