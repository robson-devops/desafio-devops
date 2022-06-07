resource "aws_instance" "globo" {
  ami                         = var.ami_ec2
  instance_type               = var.instance_type
  key_name                    = var.key_name
  associate_public_ip_address = "true"
  vpc_security_group_ids      = [aws_security_group.globo.id]
  user_data                   = file("setup.sh")
  tags                        = var.default_tags


}
