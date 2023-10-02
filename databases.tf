resource snowflake_database DEV_RAW_DB {
  name = "DEV_RAW_DB"
  is_transient = false
  data_retention_time_in_days = 7
}

resource snowflake_schema DEV_RAW_DB__SPARCS {
  database = snowflake_database.DEV_RAW_DB.name
  name = "SPARCS"
  is_managed = true
  is_transient = false
}

resource snowflake_schema DEV_RAW_DB__VITALS {
  database = snowflake_database.DEV_RAW_DB.name
  name = "VITALS"
  is_managed = true
  is_transient = false
}

resource snowflake_database PROD_RAW_DB {
  name = "PROD_RAW_DB"
  is_transient = false
  data_retention_time_in_days = 30
}

resource snowflake_schema PROD_RAW_DB__SPARCS {
  database = snowflake_database.PROD_RAW_DB.name
  name = "SPARCS"
  is_managed = true
  is_transient = false
}

resource snowflake_schema PROD_RAW_DB__VITALS {
  database = snowflake_database.PROD_RAW_DB.name
  name = "VITALS"
  is_managed = true
  is_transient = false
}