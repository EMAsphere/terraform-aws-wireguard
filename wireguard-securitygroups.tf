resource "aws_security_group" "sg_wireguard_external" {
  name        = "wireguard-${var.env}"
  description = "Wireguard Server"
  vpc_id      = var.vpc_id

  tags = {
    Name       = "wireguard-${var.env}"
    Project    = "wireguard"
    tf-managed = "True"
    env        = var.env
  }

  ingress {
    from_port   = var.wg_server_port
    to_port     = var.wg_server_port
    protocol    = "udp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
