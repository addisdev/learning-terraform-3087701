# modules/psm_rollout_percentages/outputs.tf

output "psm_rollout_percentages_table_name" {
	value = aws_dynamodb_table.psm_rollout_percentages_table.name
}
