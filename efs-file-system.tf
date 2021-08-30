resource "aws_efs_file_system" "general" {
  creation_token = var.creation_token
  encrypted = var.encrypted
  kms_key_id = var.kms_key_id
  dynamic "lifecycle_policy" {
    for_each = var.lifecycle_policy == null ? [] : [var.lifecycle_policy]
    content {
      transition_to_ia = lifecycle_policy.value.transition_to_ia
    }
  }
  performance_mode = var.performance_mode
  provisioned_throughput_in_mibps = var.provisioned_throughput_in_mibps
  throughput_mode = var.throughput_mode
  tags = var.tags
}