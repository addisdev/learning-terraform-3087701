# module/psm_table/main.tf

# DynamoDB table for Prism (psm) configuration
resource "aws_dynamodb_table" "psm_table" {
    name           = "psm"
    billing_mode   = "PAY_PER_REQUEST"
    hash_key       = "appId"

    attribute {
        name = "appId"
        type = "S"
    }

    attribute {
        name = "productName"
        type = "S"
    }

    attribute {
        name = "brand"
        type = "S"
    }

    attribute {
        name = "subBrand"
        type = "S"
    }
}