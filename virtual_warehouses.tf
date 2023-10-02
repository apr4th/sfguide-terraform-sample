resource snowflake_warehouse DEV_RAW_COMPUTE_WH {
  name = "DEV_RAW_COMPUTE_WH"
  warehouse_size = "X-Small"
  max_cluster_count = 1
  min_cluster_count = 1
  auto_suspend = 600
  auto_resume = true
  enable_query_acceleration = false
  warehouse_type = "STANDARD"
  initially_suspended = true
}

resource snowflake_warehouse PROD_RAW_COMPUTE_WH {
  name = "PROD_RAW_COMPUTE_WH"
  warehouse_size = "X-Small"
  max_cluster_count = 1
  min_cluster_count = 1
  auto_suspend = 600
  auto_resume = true
  enable_query_acceleration = false
  warehouse_type = "STANDARD"
  initially_suspended = true
}