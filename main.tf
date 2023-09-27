terraform {
  required_providers {
    snowflake = {
      source  = "apr4th/sfguide-terraform-sample"
      version = "~> 0.00"
    }
  }
}

provider "snowflake" {
  role = "SYSADMIN"
}

resource "snowflake_database" "db" {
  name = "TF_DEMO"
}

resource "snowflake_warehouse" "warehouse" {
  name           = "TF_DEMO"
  warehouse_size = "large"
  auto_suspend   = 60
}
