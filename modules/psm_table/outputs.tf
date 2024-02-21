# modules/pac_table/outputs.tf

output "psm_table_name" {
	value = aws_dynamodb_table.psm_table.name
}
