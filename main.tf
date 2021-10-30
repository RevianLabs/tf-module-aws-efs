resource "aws_security_group" "default-efs-sg" {
  count = var.security_ids == [] ? 1 : 0
  description = "Controls access to the EFS. Terraform controlled"
  vpc_id      = var.vpc_id
  name        = var.security_group_name != "" ? var.security_group_name : "${var.token_name}-sg"

  ingress {
    description     = "NFS from VPC"
    from_port       = 2049
    to_port         = 2049
    protocol        = var.security_group_ingress_protocol
    security_groups = var.security_ids
  }
  egress = null

  tags        = var.tags
}

resource "aws_efs_file_system" "efs" {
  creation_token   = var.token_name != "" ? var.token_name : "efs-token"
  performance_mode = var.performance_mode
  throughput_mode  = var.throughput_mode
  encrypted        = var.enable_encryption
  tags             = var.tags
}
 
resource "aws_efs_mount_target" "efs-mount" {
  count           = length(var.subnet_ids)
  file_system_id  = aws_efs_file_system.efs.id
  subnet_id       = var.subnet_ids[count.index]
  security_groups = var.security_ids != [] ? var.security_ids : [aws_security_group.default-efs-sg.*.id]
 }
