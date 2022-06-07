output "public_ip" {
  value       = aws_instance.globo.public_ip
  description = "O IP público da Instance"
}  