# modules/pac_table/main.tf

# DynamoDB table for PrebidAdsComponent (pac) configuration
resource "aws_dynamodb_table" "pac_table" {
    name           = "pac"
    billing_mode   = "PAY_PER_REQUEST"
    hash_key       = "appId"

    attribute {
        name = "appId"
        type = "S"
    }

    attribute {
        name = "prebidServerHost"
        type = "S"
    }

    attribute {
        name = "prebidServerAccountId"
        type = "S"
    }

    attribute {
        name = "itunesID"
        type = "S"
    }

    attribute {
        name = "domain"
        type = "S"
    }

    attribute {
        name = "publisherName"
        type = "S"
    }

    attribute {
        name = "storeURL"
        type = "S"
    }

    attribute {
        name = "customParams"
        type = "S"
    }
}