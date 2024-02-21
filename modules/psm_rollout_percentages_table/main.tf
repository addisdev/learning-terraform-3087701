# modules/psm_rollout_percentages/main.tf

# DynamoDB table for psmRolloutPercentages configuration
resource "aws_dynamodb_table" "psm_rollout_percentages_table" {
    name           = "psmRolloutPercentages"
    billing_mode   = "PAY_PER_REQUEST"
    hash_key       = "appId"
    range_key      = "psmPromo"

    attribute {
        name = "appId"
        type = "S"
    }

    attribute {
        name = "psmPromo"
        type = "N"
    }

    attribute {
        name = "psmSurvey"
        type = "N"
    }

    attribute {
        name = "psmQr"
        type = "N"
    }

    attribute {
        name = "psmAppEvents"
        type = "N"
    }

    attribute {
        name = "psmPrivacyEvents"
        type = "N"
    }

    attribute {
        name = "psmIdResolve"
        type = "N"
    }
}