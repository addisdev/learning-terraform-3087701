# modules/pac_table/variables.tf

variable "pac_table_name" {
    description = "Name for the 'pac' DynamoDB table"
    type        = string
    default     = "pac"
}
