# variables.tf

variable "psm_rollout_percentages_table_name" {
    description = "Name for the 'psmRolloutPercentages' DynamoDB table"
    type        = string
    default     = "psmRolloutPercentages"
}

