# modules/pac_table/outputs.tf

output "pac_table_name" {
  	value = aws_dynamodb_table.pac_table.name
}
