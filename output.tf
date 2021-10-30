output "efs_file_system_id" {
  description = "The ID that identifies the file system (e.g. fs-ccfc0d65)"
  value       = aws_efs_file_system.efs.id
}

output "efs_arn" {
  value       = aws_efs_file_system.efs.arn
  description = "EFS ARN"
}
