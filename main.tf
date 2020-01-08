# EC2 module
resource "aws_instance" "ec2" {
  count                       = var.instance_count
  ami                         = var.ami
  instance_type               = var.instance_type
  subnet_id                   = element(var.subnet_ids, count.index)
  key_name                    = var.key_name
  associate_public_ip_address = var.associate_public_ip_address
  vpc_security_group_ids      = var.vpc_security_group_ids
}

resource "aws_eip" "eip" {
  count    = var.create_eip ? 1 : 0
  vpc      = true
  instance = element(aws_instance.ec2.*.id, count.index)
}

resource "aws_eip_association" "eip_assoc" {
  count    = var.create_eip ? 1 : 0
  instance_id   = element(aws_instance.ec2.*.id, count.index)
  allocation_id = element(aws_eip.eip.*.id, count.index)
}
