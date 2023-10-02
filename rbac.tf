resource snowflake_role DEV_RAW_DB_SPARCS_R_AR {
  name = "DEV_RAW_DB_SPARCS_R_AR"
}

resource snowflake_role_ownership_grant role_dev_raw_db_sparcs_r_ar_ownership_grant {
  on_role_name = snowflake_role.DEV_RAW_DB_SPARCS_R_AR.name
  to_role_name = "USERADMIN"
  revert_ownership_to_role_name = "SYSADMIN"
}

resource snowflake_role DEV_RAW_DB_SPARCS_RW_AR {
  name = "DEV_RAW_DB_SPARCS_RW_AR"
}

resource snowflake_role_ownership_grant role_dev_raw_db_sparcs_rw_ar_ownership_grant {
  on_role_name = snowflake_role.DEV_RAW_DB_SPARCS_RW_AR.name
  to_role_name = "USERADMIN"
  revert_ownership_to_role_name = "SYSADMIN"
}

resource snowflake_role DEV_RAW_DB_SPARCS_FULL_AR {
  name = "DEV_RAW_DB_SPARCS_FULL_AR"
}

resource snowflake_role_ownership_grant role_dev_raw_db_sparcs_full_ar_ownership_grant {
  on_role_name = snowflake_role.DEV_RAW_DB_SPARCS_FULL_AR.name
  to_role_name = "USERADMIN"
  revert_ownership_to_role_name = "SYSADMIN"
}

resource snowflake_role DEV_RAW_DB_VITALS_R_AR {
  name = "DEV_RAW_DB_VITALS_R_AR"
}

resource snowflake_role_ownership_grant role_dev_raw_db_vitals_r_ar_ownership_grant {
  on_role_name = snowflake_role.DEV_RAW_DB_VITALS_R_AR.name
  to_role_name = "USERADMIN"
  revert_ownership_to_role_name = "SYSADMIN"
}

resource snowflake_role DEV_RAW_DB_VITALS_RW_AR {
  name = "DEV_RAW_DB_VITALS_RW_AR"
}

resource snowflake_role_ownership_grant role_dev_raw_db_vitals_rw_ar_ownership_grant {
  on_role_name = snowflake_role.DEV_RAW_DB_VITALS_RW_AR.name
  to_role_name = "USERADMIN"
  revert_ownership_to_role_name = "SYSADMIN"
}

resource snowflake_role DEV_RAW_DB_VITALS_FULL_AR {
  name = "DEV_RAW_DB_VITALS_FULL_AR"
}

resource snowflake_role_ownership_grant role_dev_raw_db_vitals_full_ar_ownership_grant {
  on_role_name = snowflake_role.DEV_RAW_DB_VITALS_FULL_AR.name
  to_role_name = "USERADMIN"
  revert_ownership_to_role_name = "SYSADMIN"
}

resource snowflake_role DEV_RAW_COMPUTE_WH_U_AR {
  name = "DEV_RAW_COMPUTE_WH_U_AR"
}

resource snowflake_role_ownership_grant role_dev_raw_compute_wh_u_ar_ownership_grant {
  on_role_name = snowflake_role.DEV_RAW_COMPUTE_WH_U_AR.name
  to_role_name = "USERADMIN"
  revert_ownership_to_role_name = "SYSADMIN"
}

resource snowflake_role DEV_RAW_COMPUTE_WH_UM_AR {
  name = "DEV_RAW_COMPUTE_WH_UM_AR"
}

resource snowflake_role_ownership_grant role_dev_raw_compute_wh_um_ar_ownership_grant {
  on_role_name = snowflake_role.DEV_RAW_COMPUTE_WH_UM_AR.name
  to_role_name = "USERADMIN"
  revert_ownership_to_role_name = "SYSADMIN"
}

resource snowflake_role DEV_RAW_COMPUTE_WH_FULL_AR {
  name = "DEV_RAW_COMPUTE_WH_FULL_AR"
}

resource snowflake_role_ownership_grant role_dev_raw_compute_wh_full_ar_ownership_grant {
  on_role_name = snowflake_role.DEV_RAW_COMPUTE_WH_FULL_AR.name
  to_role_name = "USERADMIN"
  revert_ownership_to_role_name = "SYSADMIN"
}

resource snowflake_database_grant grant_usage_on_dev_raw_db_database {
  database_name = snowflake_database.DEV_RAW_DB.name
  privilege = "USAGE"
  roles = ["DEV_RAW_DB_SPARCS_R_AR", "DEV_RAW_DB_SPARCS_RW_AR", "DEV_RAW_DB_SPARCS_FULL_AR", "DEV_RAW_DB_SPARCS_FULL_AR", "DEV_RAW_DB_VITALS_R_AR", "DEV_RAW_DB_VITALS_RW_AR", "DEV_RAW_DB_VITALS_FULL_AR", "DEV_RAW_DB_VITALS_FULL_AR"]

  with_grant_option = false
  enable_multiple_grants = true
  depends_on = [snowflake_role_ownership_grant.role_dev_raw_db_sparcs_r_ar_ownership_grant]
}

resource snowflake_schema_grant grant_usage_on_dev_raw_db__sparcs_schema {
  database_name = snowflake_database.DEV_RAW_DB.name
  schema_name = snowflake_schema.DEV_RAW_DB__SPARCS.name

  privilege = "USAGE"
  roles = [snowflake_role.DEV_RAW_DB_SPARCS_R_AR.name, snowflake_role.DEV_RAW_DB_SPARCS_RW_AR.name, snowflake_role.DEV_RAW_DB_SPARCS_FULL_AR.name, snowflake_role.DEV_RAW_DB_SPARCS_FULL_AR.name]

  depends_on = [snowflake_role_grants.role_dev_raw_db_sparcs_r_ar_grants, snowflake_role_grants.role_dev_raw_db_sparcs_rw_ar_grants, snowflake_role_grants.role_dev_raw_db_sparcs_full_ar_grants, snowflake_role_grants.role_dev_raw_db_sparcs_full_ar_grants, snowflake_role_ownership_grant.role_dev_raw_db_sparcs_r_ar_ownership_grant]

  with_grant_option = false
  enable_multiple_grants = true
}

resource snowflake_schema_grant grant_ownership_on_dev_raw_db__sparcs_schema {
  database_name = snowflake_database.DEV_RAW_DB.name
  schema_name = snowflake_schema.DEV_RAW_DB__SPARCS.name

  privilege = "OWNERSHIP"
  roles = [snowflake_role.DEV_RAW_DB_SPARCS_FULL_AR.name]

  depends_on = [snowflake_role_grants.role_dev_raw_db_sparcs_full_ar_grants, snowflake_role_ownership_grant.role_dev_raw_db_sparcs_full_ar_ownership_grant]

  with_grant_option = false
  enable_multiple_grants = true
}

resource snowflake_schema_grant grant_usage_on_dev_raw_db__vitals_schema {
  database_name = snowflake_database.DEV_RAW_DB.name
  schema_name = snowflake_schema.DEV_RAW_DB__VITALS.name

  privilege = "USAGE"
  roles = [snowflake_role.DEV_RAW_DB_VITALS_R_AR.name, snowflake_role.DEV_RAW_DB_VITALS_RW_AR.name, snowflake_role.DEV_RAW_DB_VITALS_FULL_AR.name, snowflake_role.DEV_RAW_DB_VITALS_FULL_AR.name]

  depends_on = [snowflake_role_grants.role_dev_raw_db_vitals_r_ar_grants, snowflake_role_grants.role_dev_raw_db_vitals_rw_ar_grants, snowflake_role_grants.role_dev_raw_db_vitals_full_ar_grants, snowflake_role_grants.role_dev_raw_db_vitals_full_ar_grants, snowflake_role_ownership_grant.role_dev_raw_db_vitals_r_ar_ownership_grant]

  with_grant_option = false
  enable_multiple_grants = true
}

resource snowflake_schema_grant grant_ownership_on_dev_raw_db__vitals_schema {
  database_name = snowflake_database.DEV_RAW_DB.name
  schema_name = snowflake_schema.DEV_RAW_DB__VITALS.name

  privilege = "OWNERSHIP"
  roles = [snowflake_role.DEV_RAW_DB_VITALS_FULL_AR.name]

  depends_on = [snowflake_role_grants.role_dev_raw_db_vitals_full_ar_grants, snowflake_role_ownership_grant.role_dev_raw_db_vitals_full_ar_ownership_grant]

  with_grant_option = false
  enable_multiple_grants = true
}

resource snowflake_table_grant grant_select_on_dev_raw_db__sparcs_tables {
  database_name = snowflake_database.DEV_RAW_DB.name
  schema_name = snowflake_schema.DEV_RAW_DB__SPARCS.name
  privilege = "SELECT"
  roles = [snowflake_role.DEV_RAW_DB_SPARCS_R_AR.name, snowflake_role.DEV_RAW_DB_SPARCS_RW_AR.name, snowflake_role.DEV_RAW_DB_SPARCS_FULL_AR.name]
  enable_multiple_grants = true
  on_all = true
  depends_on = [snowflake_schema_grant.grant_ownership_on_dev_raw_db__sparcs_schema, snowflake_role_ownership_grant.role_dev_raw_db_sparcs_r_ar_ownership_grant, snowflake_table_grant.grant_ownership_on_dev_raw_db__sparcs_tables]
}

resource snowflake_table_grant grant_select_on_future_dev_raw_db__sparcs_tables {
  database_name = snowflake_database.DEV_RAW_DB.name
  schema_name = snowflake_schema.DEV_RAW_DB__SPARCS.name

  privilege = "SELECT"
  roles = [snowflake_role.DEV_RAW_DB_SPARCS_R_AR.name, snowflake_role.DEV_RAW_DB_SPARCS_RW_AR.name, snowflake_role.DEV_RAW_DB_SPARCS_FULL_AR.name]

  on_future = true
  with_grant_option = false
  enable_multiple_grants = true
  depends_on = [snowflake_schema_grant.grant_ownership_on_dev_raw_db__sparcs_schema, snowflake_role_ownership_grant.role_dev_raw_db_sparcs_r_ar_ownership_grant, snowflake_table_grant.grant_ownership_on_dev_raw_db__sparcs_tables]
}

resource snowflake_table_grant grant_insert_on_dev_raw_db__sparcs_tables {
  database_name = snowflake_database.DEV_RAW_DB.name
  schema_name = snowflake_schema.DEV_RAW_DB__SPARCS.name
  privilege = "INSERT"
  roles = [snowflake_role.DEV_RAW_DB_SPARCS_RW_AR.name, snowflake_role.DEV_RAW_DB_SPARCS_FULL_AR.name]
  enable_multiple_grants = true
  on_all = true
  depends_on = [snowflake_schema_grant.grant_ownership_on_dev_raw_db__sparcs_schema, snowflake_role_ownership_grant.role_dev_raw_db_sparcs_rw_ar_ownership_grant, snowflake_table_grant.grant_ownership_on_dev_raw_db__sparcs_tables]
}

resource snowflake_table_grant grant_update_on_dev_raw_db__sparcs_tables {
  database_name = snowflake_database.DEV_RAW_DB.name
  schema_name = snowflake_schema.DEV_RAW_DB__SPARCS.name
  privilege = "UPDATE"
  roles = [snowflake_role.DEV_RAW_DB_SPARCS_RW_AR.name, snowflake_role.DEV_RAW_DB_SPARCS_FULL_AR.name]
  enable_multiple_grants = true
  on_all = true
  depends_on = [snowflake_schema_grant.grant_ownership_on_dev_raw_db__sparcs_schema, snowflake_role_ownership_grant.role_dev_raw_db_sparcs_rw_ar_ownership_grant, snowflake_table_grant.grant_ownership_on_dev_raw_db__sparcs_tables]
}

resource snowflake_table_grant grant_delete_on_dev_raw_db__sparcs_tables {
  database_name = snowflake_database.DEV_RAW_DB.name
  schema_name = snowflake_schema.DEV_RAW_DB__SPARCS.name
  privilege = "DELETE"
  roles = [snowflake_role.DEV_RAW_DB_SPARCS_RW_AR.name, snowflake_role.DEV_RAW_DB_SPARCS_FULL_AR.name]
  enable_multiple_grants = true
  on_all = true
  depends_on = [snowflake_schema_grant.grant_ownership_on_dev_raw_db__sparcs_schema, snowflake_role_ownership_grant.role_dev_raw_db_sparcs_rw_ar_ownership_grant, snowflake_table_grant.grant_ownership_on_dev_raw_db__sparcs_tables]
}

resource snowflake_table_grant grant_references_on_dev_raw_db__sparcs_tables {
  database_name = snowflake_database.DEV_RAW_DB.name
  schema_name = snowflake_schema.DEV_RAW_DB__SPARCS.name
  privilege = "REFERENCES"
  roles = [snowflake_role.DEV_RAW_DB_SPARCS_RW_AR.name, snowflake_role.DEV_RAW_DB_SPARCS_FULL_AR.name]
  enable_multiple_grants = true
  on_all = true
  depends_on = [snowflake_schema_grant.grant_ownership_on_dev_raw_db__sparcs_schema, snowflake_role_ownership_grant.role_dev_raw_db_sparcs_rw_ar_ownership_grant, snowflake_table_grant.grant_ownership_on_dev_raw_db__sparcs_tables]
}

resource snowflake_table_grant grant_insert_on_future_dev_raw_db__sparcs_tables {
  database_name = snowflake_database.DEV_RAW_DB.name
  schema_name = snowflake_schema.DEV_RAW_DB__SPARCS.name

  privilege = "INSERT"
  roles = [snowflake_role.DEV_RAW_DB_SPARCS_RW_AR.name, snowflake_role.DEV_RAW_DB_SPARCS_FULL_AR.name]

  on_future = true
  with_grant_option = false
  enable_multiple_grants = true
  depends_on = [snowflake_schema_grant.grant_ownership_on_dev_raw_db__sparcs_schema, snowflake_role_ownership_grant.role_dev_raw_db_sparcs_rw_ar_ownership_grant, snowflake_table_grant.grant_ownership_on_dev_raw_db__sparcs_tables]
}

resource snowflake_table_grant grant_update_on_future_dev_raw_db__sparcs_tables {
  database_name = snowflake_database.DEV_RAW_DB.name
  schema_name = snowflake_schema.DEV_RAW_DB__SPARCS.name

  privilege = "UPDATE"
  roles = [snowflake_role.DEV_RAW_DB_SPARCS_RW_AR.name, snowflake_role.DEV_RAW_DB_SPARCS_FULL_AR.name]

  on_future = true
  with_grant_option = false
  enable_multiple_grants = true
  depends_on = [snowflake_schema_grant.grant_ownership_on_dev_raw_db__sparcs_schema, snowflake_role_ownership_grant.role_dev_raw_db_sparcs_rw_ar_ownership_grant, snowflake_table_grant.grant_ownership_on_dev_raw_db__sparcs_tables]
}

resource snowflake_table_grant grant_delete_on_future_dev_raw_db__sparcs_tables {
  database_name = snowflake_database.DEV_RAW_DB.name
  schema_name = snowflake_schema.DEV_RAW_DB__SPARCS.name

  privilege = "DELETE"
  roles = [snowflake_role.DEV_RAW_DB_SPARCS_RW_AR.name, snowflake_role.DEV_RAW_DB_SPARCS_FULL_AR.name]

  on_future = true
  with_grant_option = false
  enable_multiple_grants = true
  depends_on = [snowflake_schema_grant.grant_ownership_on_dev_raw_db__sparcs_schema, snowflake_role_ownership_grant.role_dev_raw_db_sparcs_rw_ar_ownership_grant, snowflake_table_grant.grant_ownership_on_dev_raw_db__sparcs_tables]
}

resource snowflake_table_grant grant_references_on_future_dev_raw_db__sparcs_tables {
  database_name = snowflake_database.DEV_RAW_DB.name
  schema_name = snowflake_schema.DEV_RAW_DB__SPARCS.name

  privilege = "REFERENCES"
  roles = [snowflake_role.DEV_RAW_DB_SPARCS_RW_AR.name, snowflake_role.DEV_RAW_DB_SPARCS_FULL_AR.name]

  on_future = true
  with_grant_option = false
  enable_multiple_grants = true
  depends_on = [snowflake_schema_grant.grant_ownership_on_dev_raw_db__sparcs_schema, snowflake_role_ownership_grant.role_dev_raw_db_sparcs_rw_ar_ownership_grant, snowflake_table_grant.grant_ownership_on_dev_raw_db__sparcs_tables]
}

resource snowflake_table_grant grant_ownership_on_dev_raw_db__sparcs_tables {
  database_name = snowflake_database.DEV_RAW_DB.name
  schema_name = snowflake_schema.DEV_RAW_DB__SPARCS.name
  privilege = "OWNERSHIP"
  roles = [snowflake_role.DEV_RAW_DB_SPARCS_FULL_AR.name]
  enable_multiple_grants = true
  on_all = true
  depends_on = [snowflake_schema_grant.grant_ownership_on_dev_raw_db__sparcs_schema, snowflake_role_ownership_grant.role_dev_raw_db_sparcs_full_ar_ownership_grant]
}

resource snowflake_table_grant grant_ownership_on_future_dev_raw_db__sparcs_tables {
  database_name = snowflake_database.DEV_RAW_DB.name
  schema_name = snowflake_schema.DEV_RAW_DB__SPARCS.name

  privilege = "OWNERSHIP"
  roles = [snowflake_role.DEV_RAW_DB_SPARCS_FULL_AR.name]

  on_future = true
  with_grant_option = false
  enable_multiple_grants = true
  depends_on = [snowflake_schema_grant.grant_ownership_on_dev_raw_db__sparcs_schema, snowflake_role_ownership_grant.role_dev_raw_db_sparcs_full_ar_ownership_grant, snowflake_table_grant.grant_ownership_on_dev_raw_db__sparcs_tables]
}

resource snowflake_table_grant grant_select_on_dev_raw_db__vitals_tables {
  database_name = snowflake_database.DEV_RAW_DB.name
  schema_name = snowflake_schema.DEV_RAW_DB__VITALS.name
  privilege = "SELECT"
  roles = [snowflake_role.DEV_RAW_DB_VITALS_R_AR.name, snowflake_role.DEV_RAW_DB_VITALS_RW_AR.name, snowflake_role.DEV_RAW_DB_VITALS_FULL_AR.name]
  enable_multiple_grants = true
  on_all = true
  depends_on = [snowflake_schema_grant.grant_ownership_on_dev_raw_db__vitals_schema, snowflake_role_ownership_grant.role_dev_raw_db_vitals_r_ar_ownership_grant, snowflake_table_grant.grant_ownership_on_dev_raw_db__vitals_tables]
}

resource snowflake_table_grant grant_select_on_future_dev_raw_db__vitals_tables {
  database_name = snowflake_database.DEV_RAW_DB.name
  schema_name = snowflake_schema.DEV_RAW_DB__VITALS.name

  privilege = "SELECT"
  roles = [snowflake_role.DEV_RAW_DB_VITALS_R_AR.name, snowflake_role.DEV_RAW_DB_VITALS_RW_AR.name, snowflake_role.DEV_RAW_DB_VITALS_FULL_AR.name]

  on_future = true
  with_grant_option = false
  enable_multiple_grants = true
  depends_on = [snowflake_schema_grant.grant_ownership_on_dev_raw_db__vitals_schema, snowflake_role_ownership_grant.role_dev_raw_db_vitals_r_ar_ownership_grant, snowflake_table_grant.grant_ownership_on_dev_raw_db__vitals_tables]
}

resource snowflake_table_grant grant_insert_on_dev_raw_db__vitals_tables {
  database_name = snowflake_database.DEV_RAW_DB.name
  schema_name = snowflake_schema.DEV_RAW_DB__VITALS.name
  privilege = "INSERT"
  roles = [snowflake_role.DEV_RAW_DB_VITALS_RW_AR.name, snowflake_role.DEV_RAW_DB_VITALS_FULL_AR.name]
  enable_multiple_grants = true
  on_all = true
  depends_on = [snowflake_schema_grant.grant_ownership_on_dev_raw_db__vitals_schema, snowflake_role_ownership_grant.role_dev_raw_db_vitals_rw_ar_ownership_grant, snowflake_table_grant.grant_ownership_on_dev_raw_db__vitals_tables]
}

resource snowflake_table_grant grant_update_on_dev_raw_db__vitals_tables {
  database_name = snowflake_database.DEV_RAW_DB.name
  schema_name = snowflake_schema.DEV_RAW_DB__VITALS.name
  privilege = "UPDATE"
  roles = [snowflake_role.DEV_RAW_DB_VITALS_RW_AR.name, snowflake_role.DEV_RAW_DB_VITALS_FULL_AR.name]
  enable_multiple_grants = true
  on_all = true
  depends_on = [snowflake_schema_grant.grant_ownership_on_dev_raw_db__vitals_schema, snowflake_role_ownership_grant.role_dev_raw_db_vitals_rw_ar_ownership_grant, snowflake_table_grant.grant_ownership_on_dev_raw_db__vitals_tables]
}

resource snowflake_table_grant grant_delete_on_dev_raw_db__vitals_tables {
  database_name = snowflake_database.DEV_RAW_DB.name
  schema_name = snowflake_schema.DEV_RAW_DB__VITALS.name
  privilege = "DELETE"
  roles = [snowflake_role.DEV_RAW_DB_VITALS_RW_AR.name, snowflake_role.DEV_RAW_DB_VITALS_FULL_AR.name]
  enable_multiple_grants = true
  on_all = true
  depends_on = [snowflake_schema_grant.grant_ownership_on_dev_raw_db__vitals_schema, snowflake_role_ownership_grant.role_dev_raw_db_vitals_rw_ar_ownership_grant, snowflake_table_grant.grant_ownership_on_dev_raw_db__vitals_tables]
}

resource snowflake_table_grant grant_references_on_dev_raw_db__vitals_tables {
  database_name = snowflake_database.DEV_RAW_DB.name
  schema_name = snowflake_schema.DEV_RAW_DB__VITALS.name
  privilege = "REFERENCES"
  roles = [snowflake_role.DEV_RAW_DB_VITALS_RW_AR.name, snowflake_role.DEV_RAW_DB_VITALS_FULL_AR.name]
  enable_multiple_grants = true
  on_all = true
  depends_on = [snowflake_schema_grant.grant_ownership_on_dev_raw_db__vitals_schema, snowflake_role_ownership_grant.role_dev_raw_db_vitals_rw_ar_ownership_grant, snowflake_table_grant.grant_ownership_on_dev_raw_db__vitals_tables]
}

resource snowflake_table_grant grant_insert_on_future_dev_raw_db__vitals_tables {
  database_name = snowflake_database.DEV_RAW_DB.name
  schema_name = snowflake_schema.DEV_RAW_DB__VITALS.name

  privilege = "INSERT"
  roles = [snowflake_role.DEV_RAW_DB_VITALS_RW_AR.name, snowflake_role.DEV_RAW_DB_VITALS_FULL_AR.name]

  on_future = true
  with_grant_option = false
  enable_multiple_grants = true
  depends_on = [snowflake_schema_grant.grant_ownership_on_dev_raw_db__vitals_schema, snowflake_role_ownership_grant.role_dev_raw_db_vitals_rw_ar_ownership_grant, snowflake_table_grant.grant_ownership_on_dev_raw_db__vitals_tables]
}

resource snowflake_table_grant grant_update_on_future_dev_raw_db__vitals_tables {
  database_name = snowflake_database.DEV_RAW_DB.name
  schema_name = snowflake_schema.DEV_RAW_DB__VITALS.name

  privilege = "UPDATE"
  roles = [snowflake_role.DEV_RAW_DB_VITALS_RW_AR.name, snowflake_role.DEV_RAW_DB_VITALS_FULL_AR.name]

  on_future = true
  with_grant_option = false
  enable_multiple_grants = true
  depends_on = [snowflake_schema_grant.grant_ownership_on_dev_raw_db__vitals_schema, snowflake_role_ownership_grant.role_dev_raw_db_vitals_rw_ar_ownership_grant, snowflake_table_grant.grant_ownership_on_dev_raw_db__vitals_tables]
}

resource snowflake_table_grant grant_delete_on_future_dev_raw_db__vitals_tables {
  database_name = snowflake_database.DEV_RAW_DB.name
  schema_name = snowflake_schema.DEV_RAW_DB__VITALS.name

  privilege = "DELETE"
  roles = [snowflake_role.DEV_RAW_DB_VITALS_RW_AR.name, snowflake_role.DEV_RAW_DB_VITALS_FULL_AR.name]

  on_future = true
  with_grant_option = false
  enable_multiple_grants = true
  depends_on = [snowflake_schema_grant.grant_ownership_on_dev_raw_db__vitals_schema, snowflake_role_ownership_grant.role_dev_raw_db_vitals_rw_ar_ownership_grant, snowflake_table_grant.grant_ownership_on_dev_raw_db__vitals_tables]
}

resource snowflake_table_grant grant_references_on_future_dev_raw_db__vitals_tables {
  database_name = snowflake_database.DEV_RAW_DB.name
  schema_name = snowflake_schema.DEV_RAW_DB__VITALS.name

  privilege = "REFERENCES"
  roles = [snowflake_role.DEV_RAW_DB_VITALS_RW_AR.name, snowflake_role.DEV_RAW_DB_VITALS_FULL_AR.name]

  on_future = true
  with_grant_option = false
  enable_multiple_grants = true
  depends_on = [snowflake_schema_grant.grant_ownership_on_dev_raw_db__vitals_schema, snowflake_role_ownership_grant.role_dev_raw_db_vitals_rw_ar_ownership_grant, snowflake_table_grant.grant_ownership_on_dev_raw_db__vitals_tables]
}

resource snowflake_table_grant grant_ownership_on_dev_raw_db__vitals_tables {
  database_name = snowflake_database.DEV_RAW_DB.name
  schema_name = snowflake_schema.DEV_RAW_DB__VITALS.name
  privilege = "OWNERSHIP"
  roles = [snowflake_role.DEV_RAW_DB_VITALS_FULL_AR.name]
  enable_multiple_grants = true
  on_all = true
  depends_on = [snowflake_schema_grant.grant_ownership_on_dev_raw_db__vitals_schema, snowflake_role_ownership_grant.role_dev_raw_db_vitals_full_ar_ownership_grant]
}

resource snowflake_table_grant grant_ownership_on_future_dev_raw_db__vitals_tables {
  database_name = snowflake_database.DEV_RAW_DB.name
  schema_name = snowflake_schema.DEV_RAW_DB__VITALS.name

  privilege = "OWNERSHIP"
  roles = [snowflake_role.DEV_RAW_DB_VITALS_FULL_AR.name]

  on_future = true
  with_grant_option = false
  enable_multiple_grants = true
  depends_on = [snowflake_schema_grant.grant_ownership_on_dev_raw_db__vitals_schema, snowflake_role_ownership_grant.role_dev_raw_db_vitals_full_ar_ownership_grant, snowflake_table_grant.grant_ownership_on_dev_raw_db__vitals_tables]
}

resource snowflake_view_grant grant_select_on_dev_raw_db__sparcs_views {
  database_name = snowflake_database.DEV_RAW_DB.name
  schema_name = snowflake_schema.DEV_RAW_DB__SPARCS.name
  privilege = "SELECT"
  roles = [snowflake_role.DEV_RAW_DB_SPARCS_R_AR.name, snowflake_role.DEV_RAW_DB_SPARCS_RW_AR.name, snowflake_role.DEV_RAW_DB_SPARCS_FULL_AR.name]
  enable_multiple_grants = true
  on_all = true
  depends_on = [snowflake_schema_grant.grant_ownership_on_dev_raw_db__sparcs_schema, snowflake_role_ownership_grant.role_dev_raw_db_sparcs_r_ar_ownership_grant, snowflake_view_grant.grant_ownership_on_dev_raw_db__sparcs_views]
}

resource snowflake_view_grant grant_select_on_future_dev_raw_db__sparcs_views {
  database_name = snowflake_database.DEV_RAW_DB.name
  schema_name = snowflake_schema.DEV_RAW_DB__SPARCS.name

  privilege = "SELECT"
  roles = [snowflake_role.DEV_RAW_DB_SPARCS_R_AR.name, snowflake_role.DEV_RAW_DB_SPARCS_RW_AR.name, snowflake_role.DEV_RAW_DB_SPARCS_FULL_AR.name]

  on_future = true
  with_grant_option = false
  enable_multiple_grants = true
  depends_on = [snowflake_schema_grant.grant_ownership_on_dev_raw_db__sparcs_schema, snowflake_role_ownership_grant.role_dev_raw_db_sparcs_r_ar_ownership_grant, snowflake_view_grant.grant_ownership_on_dev_raw_db__sparcs_views]
}

resource snowflake_view_grant grant_ownership_on_dev_raw_db__sparcs_views {
  database_name = snowflake_database.DEV_RAW_DB.name
  schema_name = snowflake_schema.DEV_RAW_DB__SPARCS.name
  privilege = "OWNERSHIP"
  roles = [snowflake_role.DEV_RAW_DB_SPARCS_FULL_AR.name]
  enable_multiple_grants = true
  on_all = true
  depends_on = [snowflake_schema_grant.grant_ownership_on_dev_raw_db__sparcs_schema, snowflake_role_ownership_grant.role_dev_raw_db_sparcs_full_ar_ownership_grant]
}

resource snowflake_view_grant grant_ownership_on_future_dev_raw_db__sparcs_views {
  database_name = snowflake_database.DEV_RAW_DB.name
  schema_name = snowflake_schema.DEV_RAW_DB__SPARCS.name

  privilege = "OWNERSHIP"
  roles = [snowflake_role.DEV_RAW_DB_SPARCS_FULL_AR.name]

  on_future = true
  with_grant_option = false
  enable_multiple_grants = true
  depends_on = [snowflake_schema_grant.grant_ownership_on_dev_raw_db__sparcs_schema, snowflake_role_ownership_grant.role_dev_raw_db_sparcs_full_ar_ownership_grant, snowflake_view_grant.grant_ownership_on_dev_raw_db__sparcs_views]
}

resource snowflake_view_grant grant_select_on_dev_raw_db__vitals_views {
  database_name = snowflake_database.DEV_RAW_DB.name
  schema_name = snowflake_schema.DEV_RAW_DB__VITALS.name
  privilege = "SELECT"
  roles = [snowflake_role.DEV_RAW_DB_VITALS_R_AR.name, snowflake_role.DEV_RAW_DB_VITALS_RW_AR.name, snowflake_role.DEV_RAW_DB_VITALS_FULL_AR.name]
  enable_multiple_grants = true
  on_all = true
  depends_on = [snowflake_schema_grant.grant_ownership_on_dev_raw_db__vitals_schema, snowflake_role_ownership_grant.role_dev_raw_db_vitals_r_ar_ownership_grant, snowflake_view_grant.grant_ownership_on_dev_raw_db__vitals_views]
}

resource snowflake_view_grant grant_select_on_future_dev_raw_db__vitals_views {
  database_name = snowflake_database.DEV_RAW_DB.name
  schema_name = snowflake_schema.DEV_RAW_DB__VITALS.name

  privilege = "SELECT"
  roles = [snowflake_role.DEV_RAW_DB_VITALS_R_AR.name, snowflake_role.DEV_RAW_DB_VITALS_RW_AR.name, snowflake_role.DEV_RAW_DB_VITALS_FULL_AR.name]

  on_future = true
  with_grant_option = false
  enable_multiple_grants = true
  depends_on = [snowflake_schema_grant.grant_ownership_on_dev_raw_db__vitals_schema, snowflake_role_ownership_grant.role_dev_raw_db_vitals_r_ar_ownership_grant, snowflake_view_grant.grant_ownership_on_dev_raw_db__vitals_views]
}

resource snowflake_view_grant grant_ownership_on_dev_raw_db__vitals_views {
  database_name = snowflake_database.DEV_RAW_DB.name
  schema_name = snowflake_schema.DEV_RAW_DB__VITALS.name
  privilege = "OWNERSHIP"
  roles = [snowflake_role.DEV_RAW_DB_VITALS_FULL_AR.name]
  enable_multiple_grants = true
  on_all = true
  depends_on = [snowflake_schema_grant.grant_ownership_on_dev_raw_db__vitals_schema, snowflake_role_ownership_grant.role_dev_raw_db_vitals_full_ar_ownership_grant]
}

resource snowflake_view_grant grant_ownership_on_future_dev_raw_db__vitals_views {
  database_name = snowflake_database.DEV_RAW_DB.name
  schema_name = snowflake_schema.DEV_RAW_DB__VITALS.name

  privilege = "OWNERSHIP"
  roles = [snowflake_role.DEV_RAW_DB_VITALS_FULL_AR.name]

  on_future = true
  with_grant_option = false
  enable_multiple_grants = true
  depends_on = [snowflake_schema_grant.grant_ownership_on_dev_raw_db__vitals_schema, snowflake_role_ownership_grant.role_dev_raw_db_vitals_full_ar_ownership_grant, snowflake_view_grant.grant_ownership_on_dev_raw_db__vitals_views]
}

resource snowflake_sequence_grant grant_usage_on_dev_raw_db__sparcs_sequences {
  database_name = snowflake_database.DEV_RAW_DB.name
  schema_name = snowflake_schema.DEV_RAW_DB__SPARCS.name
  privilege = "USAGE"
  roles = [snowflake_role.DEV_RAW_DB_SPARCS_R_AR.name, snowflake_role.DEV_RAW_DB_SPARCS_RW_AR.name, snowflake_role.DEV_RAW_DB_SPARCS_FULL_AR.name]
  enable_multiple_grants = true
  on_all = true
  depends_on = [snowflake_schema_grant.grant_ownership_on_dev_raw_db__sparcs_schema, snowflake_role_ownership_grant.role_dev_raw_db_sparcs_r_ar_ownership_grant, snowflake_sequence_grant.grant_ownership_on_dev_raw_db__sparcs_sequences]
}

resource snowflake_sequence_grant grant_usage_on_future_dev_raw_db__sparcs_sequences {
  database_name = snowflake_database.DEV_RAW_DB.name
  schema_name = snowflake_schema.DEV_RAW_DB__SPARCS.name

  privilege = "USAGE"
  roles = [snowflake_role.DEV_RAW_DB_SPARCS_R_AR.name, snowflake_role.DEV_RAW_DB_SPARCS_RW_AR.name, snowflake_role.DEV_RAW_DB_SPARCS_FULL_AR.name]

  on_future = true
  with_grant_option = false
  enable_multiple_grants = true
  depends_on = [snowflake_schema_grant.grant_ownership_on_dev_raw_db__sparcs_schema, snowflake_role_ownership_grant.role_dev_raw_db_sparcs_r_ar_ownership_grant, snowflake_sequence_grant.grant_ownership_on_dev_raw_db__sparcs_sequences]
}

resource snowflake_sequence_grant grant_ownership_on_dev_raw_db__sparcs_sequences {
  database_name = snowflake_database.DEV_RAW_DB.name
  schema_name = snowflake_schema.DEV_RAW_DB__SPARCS.name
  privilege = "OWNERSHIP"
  roles = [snowflake_role.DEV_RAW_DB_SPARCS_FULL_AR.name]
  enable_multiple_grants = true
  on_all = true
  depends_on = [snowflake_schema_grant.grant_ownership_on_dev_raw_db__sparcs_schema, snowflake_role_ownership_grant.role_dev_raw_db_sparcs_full_ar_ownership_grant]
}

resource snowflake_sequence_grant grant_ownership_on_future_dev_raw_db__sparcs_sequences {
  database_name = snowflake_database.DEV_RAW_DB.name
  schema_name = snowflake_schema.DEV_RAW_DB__SPARCS.name

  privilege = "OWNERSHIP"
  roles = [snowflake_role.DEV_RAW_DB_SPARCS_FULL_AR.name]

  on_future = true
  with_grant_option = false
  enable_multiple_grants = true
  depends_on = [snowflake_schema_grant.grant_ownership_on_dev_raw_db__sparcs_schema, snowflake_role_ownership_grant.role_dev_raw_db_sparcs_full_ar_ownership_grant, snowflake_sequence_grant.grant_ownership_on_dev_raw_db__sparcs_sequences]
}

resource snowflake_sequence_grant grant_usage_on_dev_raw_db__vitals_sequences {
  database_name = snowflake_database.DEV_RAW_DB.name
  schema_name = snowflake_schema.DEV_RAW_DB__VITALS.name
  privilege = "USAGE"
  roles = [snowflake_role.DEV_RAW_DB_VITALS_R_AR.name, snowflake_role.DEV_RAW_DB_VITALS_RW_AR.name, snowflake_role.DEV_RAW_DB_VITALS_FULL_AR.name]
  enable_multiple_grants = true
  on_all = true
  depends_on = [snowflake_schema_grant.grant_ownership_on_dev_raw_db__vitals_schema, snowflake_role_ownership_grant.role_dev_raw_db_vitals_r_ar_ownership_grant, snowflake_sequence_grant.grant_ownership_on_dev_raw_db__vitals_sequences]
}

resource snowflake_sequence_grant grant_usage_on_future_dev_raw_db__vitals_sequences {
  database_name = snowflake_database.DEV_RAW_DB.name
  schema_name = snowflake_schema.DEV_RAW_DB__VITALS.name

  privilege = "USAGE"
  roles = [snowflake_role.DEV_RAW_DB_VITALS_R_AR.name, snowflake_role.DEV_RAW_DB_VITALS_RW_AR.name, snowflake_role.DEV_RAW_DB_VITALS_FULL_AR.name]

  on_future = true
  with_grant_option = false
  enable_multiple_grants = true
  depends_on = [snowflake_schema_grant.grant_ownership_on_dev_raw_db__vitals_schema, snowflake_role_ownership_grant.role_dev_raw_db_vitals_r_ar_ownership_grant, snowflake_sequence_grant.grant_ownership_on_dev_raw_db__vitals_sequences]
}

resource snowflake_sequence_grant grant_ownership_on_dev_raw_db__vitals_sequences {
  database_name = snowflake_database.DEV_RAW_DB.name
  schema_name = snowflake_schema.DEV_RAW_DB__VITALS.name
  privilege = "OWNERSHIP"
  roles = [snowflake_role.DEV_RAW_DB_VITALS_FULL_AR.name]
  enable_multiple_grants = true
  on_all = true
  depends_on = [snowflake_schema_grant.grant_ownership_on_dev_raw_db__vitals_schema, snowflake_role_ownership_grant.role_dev_raw_db_vitals_full_ar_ownership_grant]
}

resource snowflake_sequence_grant grant_ownership_on_future_dev_raw_db__vitals_sequences {
  database_name = snowflake_database.DEV_RAW_DB.name
  schema_name = snowflake_schema.DEV_RAW_DB__VITALS.name

  privilege = "OWNERSHIP"
  roles = [snowflake_role.DEV_RAW_DB_VITALS_FULL_AR.name]

  on_future = true
  with_grant_option = false
  enable_multiple_grants = true
  depends_on = [snowflake_schema_grant.grant_ownership_on_dev_raw_db__vitals_schema, snowflake_role_ownership_grant.role_dev_raw_db_vitals_full_ar_ownership_grant, snowflake_sequence_grant.grant_ownership_on_dev_raw_db__vitals_sequences]
}

resource snowflake_stage_grant grant_usage_on_dev_raw_db__sparcs_stages {
  database_name = snowflake_database.DEV_RAW_DB.name
  schema_name = snowflake_schema.DEV_RAW_DB__SPARCS.name
  privilege = "USAGE"
  roles = [snowflake_role.DEV_RAW_DB_SPARCS_R_AR.name, snowflake_role.DEV_RAW_DB_SPARCS_RW_AR.name, snowflake_role.DEV_RAW_DB_SPARCS_FULL_AR.name]
  enable_multiple_grants = true
  on_all = true
  depends_on = [snowflake_schema_grant.grant_ownership_on_dev_raw_db__sparcs_schema, snowflake_role_ownership_grant.role_dev_raw_db_sparcs_r_ar_ownership_grant, snowflake_stage_grant.grant_ownership_on_dev_raw_db__sparcs_stages]
}

resource snowflake_stage_grant grant_read_on_dev_raw_db__sparcs_stages {
  database_name = snowflake_database.DEV_RAW_DB.name
  schema_name = snowflake_schema.DEV_RAW_DB__SPARCS.name
  privilege = "READ"
  roles = [snowflake_role.DEV_RAW_DB_SPARCS_R_AR.name, snowflake_role.DEV_RAW_DB_SPARCS_RW_AR.name, snowflake_role.DEV_RAW_DB_SPARCS_FULL_AR.name]
  enable_multiple_grants = true
  on_all = true
  depends_on = [snowflake_schema_grant.grant_ownership_on_dev_raw_db__sparcs_schema, snowflake_role_ownership_grant.role_dev_raw_db_sparcs_r_ar_ownership_grant, snowflake_stage_grant.grant_ownership_on_dev_raw_db__sparcs_stages]
}

resource snowflake_stage_grant grant_usage_on_future_dev_raw_db__sparcs_stages {
  database_name = snowflake_database.DEV_RAW_DB.name
  schema_name = snowflake_schema.DEV_RAW_DB__SPARCS.name

  privilege = "USAGE"
  roles = [snowflake_role.DEV_RAW_DB_SPARCS_R_AR.name, snowflake_role.DEV_RAW_DB_SPARCS_RW_AR.name, snowflake_role.DEV_RAW_DB_SPARCS_FULL_AR.name]

  on_future = true
  with_grant_option = false
  enable_multiple_grants = true
  depends_on = [snowflake_schema_grant.grant_ownership_on_dev_raw_db__sparcs_schema, snowflake_role_ownership_grant.role_dev_raw_db_sparcs_r_ar_ownership_grant, snowflake_stage_grant.grant_ownership_on_dev_raw_db__sparcs_stages]
}

resource snowflake_stage_grant grant_read_on_future_dev_raw_db__sparcs_stages {
  database_name = snowflake_database.DEV_RAW_DB.name
  schema_name = snowflake_schema.DEV_RAW_DB__SPARCS.name

  privilege = "READ"
  roles = [snowflake_role.DEV_RAW_DB_SPARCS_R_AR.name, snowflake_role.DEV_RAW_DB_SPARCS_RW_AR.name, snowflake_role.DEV_RAW_DB_SPARCS_FULL_AR.name]

  on_future = true
  with_grant_option = false
  enable_multiple_grants = true
  depends_on = [snowflake_schema_grant.grant_ownership_on_dev_raw_db__sparcs_schema, snowflake_role_ownership_grant.role_dev_raw_db_sparcs_r_ar_ownership_grant, snowflake_stage_grant.grant_ownership_on_dev_raw_db__sparcs_stages]
}

resource snowflake_stage_grant grant_write_on_future_dev_raw_db__sparcs_stages {
  database_name = snowflake_database.DEV_RAW_DB.name
  schema_name = snowflake_schema.DEV_RAW_DB__SPARCS.name

  privilege = "WRITE"
  roles = [snowflake_role.DEV_RAW_DB_SPARCS_RW_AR.name, snowflake_role.DEV_RAW_DB_SPARCS_FULL_AR.name]

  on_future = true
  with_grant_option = false
  enable_multiple_grants = true
  depends_on = [snowflake_stage_grant.grant_usage_on_future_dev_raw_db__sparcs_stages, snowflake_stage_grant.grant_read_on_future_dev_raw_db__sparcs_stages, snowflake_role_ownership_grant.role_dev_raw_db_sparcs_rw_ar_ownership_grant, snowflake_stage_grant.grant_ownership_on_dev_raw_db__sparcs_stages]
}

resource snowflake_stage_grant grant_write_on_dev_raw_db__sparcs_stages {
  database_name = snowflake_database.DEV_RAW_DB.name
  schema_name = snowflake_schema.DEV_RAW_DB__SPARCS.name
  privilege = "WRITE"
  roles = [snowflake_role.DEV_RAW_DB_SPARCS_RW_AR.name, snowflake_role.DEV_RAW_DB_SPARCS_FULL_AR.name]
  enable_multiple_grants = true
  on_all = true
  depends_on = [snowflake_schema_grant.grant_ownership_on_dev_raw_db__sparcs_schema, snowflake_role_ownership_grant.role_dev_raw_db_sparcs_rw_ar_ownership_grant, snowflake_stage_grant.grant_ownership_on_dev_raw_db__sparcs_stages]
}

resource snowflake_stage_grant grant_ownership_on_dev_raw_db__sparcs_stages {
  database_name = snowflake_database.DEV_RAW_DB.name
  schema_name = snowflake_schema.DEV_RAW_DB__SPARCS.name
  privilege = "OWNERSHIP"
  roles = [snowflake_role.DEV_RAW_DB_SPARCS_FULL_AR.name]
  enable_multiple_grants = true
  on_all = true
  depends_on = [snowflake_schema_grant.grant_ownership_on_dev_raw_db__sparcs_schema, snowflake_role_ownership_grant.role_dev_raw_db_sparcs_full_ar_ownership_grant]
}

resource snowflake_stage_grant grant_ownership_on_future_dev_raw_db__sparcs_stages {
  database_name = snowflake_database.DEV_RAW_DB.name
  schema_name = snowflake_schema.DEV_RAW_DB__SPARCS.name

  privilege = "OWNERSHIP"
  roles = [snowflake_role.DEV_RAW_DB_SPARCS_FULL_AR.name]

  on_future = true
  with_grant_option = false
  enable_multiple_grants = true
  depends_on = [snowflake_schema_grant.grant_ownership_on_dev_raw_db__sparcs_schema, snowflake_role_ownership_grant.role_dev_raw_db_sparcs_full_ar_ownership_grant, snowflake_stage_grant.grant_ownership_on_dev_raw_db__sparcs_stages]
}

resource snowflake_stage_grant grant_usage_on_dev_raw_db__vitals_stages {
  database_name = snowflake_database.DEV_RAW_DB.name
  schema_name = snowflake_schema.DEV_RAW_DB__VITALS.name
  privilege = "USAGE"
  roles = [snowflake_role.DEV_RAW_DB_VITALS_R_AR.name, snowflake_role.DEV_RAW_DB_VITALS_RW_AR.name, snowflake_role.DEV_RAW_DB_VITALS_FULL_AR.name]
  enable_multiple_grants = true
  on_all = true
  depends_on = [snowflake_schema_grant.grant_ownership_on_dev_raw_db__vitals_schema, snowflake_role_ownership_grant.role_dev_raw_db_vitals_r_ar_ownership_grant, snowflake_stage_grant.grant_ownership_on_dev_raw_db__vitals_stages]
}

resource snowflake_stage_grant grant_read_on_dev_raw_db__vitals_stages {
  database_name = snowflake_database.DEV_RAW_DB.name
  schema_name = snowflake_schema.DEV_RAW_DB__VITALS.name
  privilege = "READ"
  roles = [snowflake_role.DEV_RAW_DB_VITALS_R_AR.name, snowflake_role.DEV_RAW_DB_VITALS_RW_AR.name, snowflake_role.DEV_RAW_DB_VITALS_FULL_AR.name]
  enable_multiple_grants = true
  on_all = true
  depends_on = [snowflake_schema_grant.grant_ownership_on_dev_raw_db__vitals_schema, snowflake_role_ownership_grant.role_dev_raw_db_vitals_r_ar_ownership_grant, snowflake_stage_grant.grant_ownership_on_dev_raw_db__vitals_stages]
}

resource snowflake_stage_grant grant_usage_on_future_dev_raw_db__vitals_stages {
  database_name = snowflake_database.DEV_RAW_DB.name
  schema_name = snowflake_schema.DEV_RAW_DB__VITALS.name

  privilege = "USAGE"
  roles = [snowflake_role.DEV_RAW_DB_VITALS_R_AR.name, snowflake_role.DEV_RAW_DB_VITALS_RW_AR.name, snowflake_role.DEV_RAW_DB_VITALS_FULL_AR.name]

  on_future = true
  with_grant_option = false
  enable_multiple_grants = true
  depends_on = [snowflake_schema_grant.grant_ownership_on_dev_raw_db__vitals_schema, snowflake_role_ownership_grant.role_dev_raw_db_vitals_r_ar_ownership_grant, snowflake_stage_grant.grant_ownership_on_dev_raw_db__vitals_stages]
}

resource snowflake_stage_grant grant_read_on_future_dev_raw_db__vitals_stages {
  database_name = snowflake_database.DEV_RAW_DB.name
  schema_name = snowflake_schema.DEV_RAW_DB__VITALS.name

  privilege = "READ"
  roles = [snowflake_role.DEV_RAW_DB_VITALS_R_AR.name, snowflake_role.DEV_RAW_DB_VITALS_RW_AR.name, snowflake_role.DEV_RAW_DB_VITALS_FULL_AR.name]

  on_future = true
  with_grant_option = false
  enable_multiple_grants = true
  depends_on = [snowflake_schema_grant.grant_ownership_on_dev_raw_db__vitals_schema, snowflake_role_ownership_grant.role_dev_raw_db_vitals_r_ar_ownership_grant, snowflake_stage_grant.grant_ownership_on_dev_raw_db__vitals_stages]
}

resource snowflake_stage_grant grant_write_on_future_dev_raw_db__vitals_stages {
  database_name = snowflake_database.DEV_RAW_DB.name
  schema_name = snowflake_schema.DEV_RAW_DB__VITALS.name

  privilege = "WRITE"
  roles = [snowflake_role.DEV_RAW_DB_VITALS_RW_AR.name, snowflake_role.DEV_RAW_DB_VITALS_FULL_AR.name]

  on_future = true
  with_grant_option = false
  enable_multiple_grants = true
  depends_on = [snowflake_stage_grant.grant_usage_on_future_dev_raw_db__vitals_stages, snowflake_stage_grant.grant_read_on_future_dev_raw_db__vitals_stages, snowflake_role_ownership_grant.role_dev_raw_db_vitals_rw_ar_ownership_grant, snowflake_stage_grant.grant_ownership_on_dev_raw_db__vitals_stages]
}

resource snowflake_stage_grant grant_write_on_dev_raw_db__vitals_stages {
  database_name = snowflake_database.DEV_RAW_DB.name
  schema_name = snowflake_schema.DEV_RAW_DB__VITALS.name
  privilege = "WRITE"
  roles = [snowflake_role.DEV_RAW_DB_VITALS_RW_AR.name, snowflake_role.DEV_RAW_DB_VITALS_FULL_AR.name]
  enable_multiple_grants = true
  on_all = true
  depends_on = [snowflake_schema_grant.grant_ownership_on_dev_raw_db__vitals_schema, snowflake_role_ownership_grant.role_dev_raw_db_vitals_rw_ar_ownership_grant, snowflake_stage_grant.grant_ownership_on_dev_raw_db__vitals_stages]
}

resource snowflake_stage_grant grant_ownership_on_dev_raw_db__vitals_stages {
  database_name = snowflake_database.DEV_RAW_DB.name
  schema_name = snowflake_schema.DEV_RAW_DB__VITALS.name
  privilege = "OWNERSHIP"
  roles = [snowflake_role.DEV_RAW_DB_VITALS_FULL_AR.name]
  enable_multiple_grants = true
  on_all = true
  depends_on = [snowflake_schema_grant.grant_ownership_on_dev_raw_db__vitals_schema, snowflake_role_ownership_grant.role_dev_raw_db_vitals_full_ar_ownership_grant]
}

resource snowflake_stage_grant grant_ownership_on_future_dev_raw_db__vitals_stages {
  database_name = snowflake_database.DEV_RAW_DB.name
  schema_name = snowflake_schema.DEV_RAW_DB__VITALS.name

  privilege = "OWNERSHIP"
  roles = [snowflake_role.DEV_RAW_DB_VITALS_FULL_AR.name]

  on_future = true
  with_grant_option = false
  enable_multiple_grants = true
  depends_on = [snowflake_schema_grant.grant_ownership_on_dev_raw_db__vitals_schema, snowflake_role_ownership_grant.role_dev_raw_db_vitals_full_ar_ownership_grant, snowflake_stage_grant.grant_ownership_on_dev_raw_db__vitals_stages]
}

resource snowflake_file_format_grant grant_usage_on_dev_raw_db__sparcs_file_formats {
  database_name = snowflake_database.DEV_RAW_DB.name
  schema_name = snowflake_schema.DEV_RAW_DB__SPARCS.name
  privilege = "USAGE"
  roles = [snowflake_role.DEV_RAW_DB_SPARCS_R_AR.name, snowflake_role.DEV_RAW_DB_SPARCS_RW_AR.name, snowflake_role.DEV_RAW_DB_SPARCS_FULL_AR.name]
  enable_multiple_grants = true
  on_all = true
  depends_on = [snowflake_schema_grant.grant_ownership_on_dev_raw_db__sparcs_schema, snowflake_role_ownership_grant.role_dev_raw_db_sparcs_r_ar_ownership_grant, snowflake_file_format_grant.grant_ownership_on_dev_raw_db__sparcs_file_formats]
}

resource snowflake_file_format_grant grant_usage_on_future_dev_raw_db__sparcs_file_formats {
  database_name = snowflake_database.DEV_RAW_DB.name
  schema_name = snowflake_schema.DEV_RAW_DB__SPARCS.name

  privilege = "USAGE"
  roles = [snowflake_role.DEV_RAW_DB_SPARCS_R_AR.name, snowflake_role.DEV_RAW_DB_SPARCS_RW_AR.name, snowflake_role.DEV_RAW_DB_SPARCS_FULL_AR.name]

  on_future = true
  with_grant_option = false
  enable_multiple_grants = true
  depends_on = [snowflake_schema_grant.grant_ownership_on_dev_raw_db__sparcs_schema, snowflake_role_ownership_grant.role_dev_raw_db_sparcs_r_ar_ownership_grant, snowflake_file_format_grant.grant_ownership_on_dev_raw_db__sparcs_file_formats]
}

resource snowflake_file_format_grant grant_ownership_on_dev_raw_db__sparcs_file_formats {
  database_name = snowflake_database.DEV_RAW_DB.name
  schema_name = snowflake_schema.DEV_RAW_DB__SPARCS.name
  privilege = "OWNERSHIP"
  roles = [snowflake_role.DEV_RAW_DB_SPARCS_FULL_AR.name]
  enable_multiple_grants = true
  on_all = true
  depends_on = [snowflake_schema_grant.grant_ownership_on_dev_raw_db__sparcs_schema, snowflake_role_ownership_grant.role_dev_raw_db_sparcs_full_ar_ownership_grant]
}

resource snowflake_file_format_grant grant_ownership_on_future_dev_raw_db__sparcs_file_formats {
  database_name = snowflake_database.DEV_RAW_DB.name
  schema_name = snowflake_schema.DEV_RAW_DB__SPARCS.name

  privilege = "OWNERSHIP"
  roles = [snowflake_role.DEV_RAW_DB_SPARCS_FULL_AR.name]

  on_future = true
  with_grant_option = false
  enable_multiple_grants = true
  depends_on = [snowflake_schema_grant.grant_ownership_on_dev_raw_db__sparcs_schema, snowflake_role_ownership_grant.role_dev_raw_db_sparcs_full_ar_ownership_grant, snowflake_file_format_grant.grant_ownership_on_dev_raw_db__sparcs_file_formats]
}

resource snowflake_file_format_grant grant_usage_on_dev_raw_db__vitals_file_formats {
  database_name = snowflake_database.DEV_RAW_DB.name
  schema_name = snowflake_schema.DEV_RAW_DB__VITALS.name
  privilege = "USAGE"
  roles = [snowflake_role.DEV_RAW_DB_VITALS_R_AR.name, snowflake_role.DEV_RAW_DB_VITALS_RW_AR.name, snowflake_role.DEV_RAW_DB_VITALS_FULL_AR.name]
  enable_multiple_grants = true
  on_all = true
  depends_on = [snowflake_schema_grant.grant_ownership_on_dev_raw_db__vitals_schema, snowflake_role_ownership_grant.role_dev_raw_db_vitals_r_ar_ownership_grant, snowflake_file_format_grant.grant_ownership_on_dev_raw_db__vitals_file_formats]
}

resource snowflake_file_format_grant grant_usage_on_future_dev_raw_db__vitals_file_formats {
  database_name = snowflake_database.DEV_RAW_DB.name
  schema_name = snowflake_schema.DEV_RAW_DB__VITALS.name

  privilege = "USAGE"
  roles = [snowflake_role.DEV_RAW_DB_VITALS_R_AR.name, snowflake_role.DEV_RAW_DB_VITALS_RW_AR.name, snowflake_role.DEV_RAW_DB_VITALS_FULL_AR.name]

  on_future = true
  with_grant_option = false
  enable_multiple_grants = true
  depends_on = [snowflake_schema_grant.grant_ownership_on_dev_raw_db__vitals_schema, snowflake_role_ownership_grant.role_dev_raw_db_vitals_r_ar_ownership_grant, snowflake_file_format_grant.grant_ownership_on_dev_raw_db__vitals_file_formats]
}

resource snowflake_file_format_grant grant_ownership_on_dev_raw_db__vitals_file_formats {
  database_name = snowflake_database.DEV_RAW_DB.name
  schema_name = snowflake_schema.DEV_RAW_DB__VITALS.name
  privilege = "OWNERSHIP"
  roles = [snowflake_role.DEV_RAW_DB_VITALS_FULL_AR.name]
  enable_multiple_grants = true
  on_all = true
  depends_on = [snowflake_schema_grant.grant_ownership_on_dev_raw_db__vitals_schema, snowflake_role_ownership_grant.role_dev_raw_db_vitals_full_ar_ownership_grant]
}

resource snowflake_file_format_grant grant_ownership_on_future_dev_raw_db__vitals_file_formats {
  database_name = snowflake_database.DEV_RAW_DB.name
  schema_name = snowflake_schema.DEV_RAW_DB__VITALS.name

  privilege = "OWNERSHIP"
  roles = [snowflake_role.DEV_RAW_DB_VITALS_FULL_AR.name]

  on_future = true
  with_grant_option = false
  enable_multiple_grants = true
  depends_on = [snowflake_schema_grant.grant_ownership_on_dev_raw_db__vitals_schema, snowflake_role_ownership_grant.role_dev_raw_db_vitals_full_ar_ownership_grant, snowflake_file_format_grant.grant_ownership_on_dev_raw_db__vitals_file_formats]
}

resource snowflake_stream_grant grant_select_on_dev_raw_db__sparcs_streams {
  database_name = snowflake_database.DEV_RAW_DB.name
  schema_name = snowflake_schema.DEV_RAW_DB__SPARCS.name
  privilege = "SELECT"
  roles = [snowflake_role.DEV_RAW_DB_SPARCS_R_AR.name, snowflake_role.DEV_RAW_DB_SPARCS_RW_AR.name, snowflake_role.DEV_RAW_DB_SPARCS_FULL_AR.name]
  enable_multiple_grants = true
  on_all = true
  depends_on = [snowflake_schema_grant.grant_ownership_on_dev_raw_db__sparcs_schema, snowflake_role_ownership_grant.role_dev_raw_db_sparcs_r_ar_ownership_grant, snowflake_stream_grant.grant_ownership_on_dev_raw_db__sparcs_streams]
}

resource snowflake_stream_grant grant_select_on_future_dev_raw_db__sparcs_streams {
  database_name = snowflake_database.DEV_RAW_DB.name
  schema_name = snowflake_schema.DEV_RAW_DB__SPARCS.name

  privilege = "SELECT"
  roles = [snowflake_role.DEV_RAW_DB_SPARCS_R_AR.name, snowflake_role.DEV_RAW_DB_SPARCS_RW_AR.name, snowflake_role.DEV_RAW_DB_SPARCS_FULL_AR.name]

  on_future = true
  with_grant_option = false
  enable_multiple_grants = true
  depends_on = [snowflake_schema_grant.grant_ownership_on_dev_raw_db__sparcs_schema, snowflake_role_ownership_grant.role_dev_raw_db_sparcs_r_ar_ownership_grant, snowflake_stream_grant.grant_ownership_on_dev_raw_db__sparcs_streams]
}

resource snowflake_stream_grant grant_ownership_on_dev_raw_db__sparcs_streams {
  database_name = snowflake_database.DEV_RAW_DB.name
  schema_name = snowflake_schema.DEV_RAW_DB__SPARCS.name
  privilege = "OWNERSHIP"
  roles = [snowflake_role.DEV_RAW_DB_SPARCS_FULL_AR.name]
  enable_multiple_grants = true
  on_all = true
  depends_on = [snowflake_schema_grant.grant_ownership_on_dev_raw_db__sparcs_schema, snowflake_role_ownership_grant.role_dev_raw_db_sparcs_full_ar_ownership_grant]
}

resource snowflake_stream_grant grant_ownership_on_future_dev_raw_db__sparcs_streams {
  database_name = snowflake_database.DEV_RAW_DB.name
  schema_name = snowflake_schema.DEV_RAW_DB__SPARCS.name

  privilege = "OWNERSHIP"
  roles = [snowflake_role.DEV_RAW_DB_SPARCS_FULL_AR.name]

  on_future = true
  with_grant_option = false
  enable_multiple_grants = true
  depends_on = [snowflake_schema_grant.grant_ownership_on_dev_raw_db__sparcs_schema, snowflake_role_ownership_grant.role_dev_raw_db_sparcs_full_ar_ownership_grant, snowflake_stream_grant.grant_ownership_on_dev_raw_db__sparcs_streams]
}

resource snowflake_stream_grant grant_select_on_dev_raw_db__vitals_streams {
  database_name = snowflake_database.DEV_RAW_DB.name
  schema_name = snowflake_schema.DEV_RAW_DB__VITALS.name
  privilege = "SELECT"
  roles = [snowflake_role.DEV_RAW_DB_VITALS_R_AR.name, snowflake_role.DEV_RAW_DB_VITALS_RW_AR.name, snowflake_role.DEV_RAW_DB_VITALS_FULL_AR.name]
  enable_multiple_grants = true
  on_all = true
  depends_on = [snowflake_schema_grant.grant_ownership_on_dev_raw_db__vitals_schema, snowflake_role_ownership_grant.role_dev_raw_db_vitals_r_ar_ownership_grant, snowflake_stream_grant.grant_ownership_on_dev_raw_db__vitals_streams]
}

resource snowflake_stream_grant grant_select_on_future_dev_raw_db__vitals_streams {
  database_name = snowflake_database.DEV_RAW_DB.name
  schema_name = snowflake_schema.DEV_RAW_DB__VITALS.name

  privilege = "SELECT"
  roles = [snowflake_role.DEV_RAW_DB_VITALS_R_AR.name, snowflake_role.DEV_RAW_DB_VITALS_RW_AR.name, snowflake_role.DEV_RAW_DB_VITALS_FULL_AR.name]

  on_future = true
  with_grant_option = false
  enable_multiple_grants = true
  depends_on = [snowflake_schema_grant.grant_ownership_on_dev_raw_db__vitals_schema, snowflake_role_ownership_grant.role_dev_raw_db_vitals_r_ar_ownership_grant, snowflake_stream_grant.grant_ownership_on_dev_raw_db__vitals_streams]
}

resource snowflake_stream_grant grant_ownership_on_dev_raw_db__vitals_streams {
  database_name = snowflake_database.DEV_RAW_DB.name
  schema_name = snowflake_schema.DEV_RAW_DB__VITALS.name
  privilege = "OWNERSHIP"
  roles = [snowflake_role.DEV_RAW_DB_VITALS_FULL_AR.name]
  enable_multiple_grants = true
  on_all = true
  depends_on = [snowflake_schema_grant.grant_ownership_on_dev_raw_db__vitals_schema, snowflake_role_ownership_grant.role_dev_raw_db_vitals_full_ar_ownership_grant]
}

resource snowflake_stream_grant grant_ownership_on_future_dev_raw_db__vitals_streams {
  database_name = snowflake_database.DEV_RAW_DB.name
  schema_name = snowflake_schema.DEV_RAW_DB__VITALS.name

  privilege = "OWNERSHIP"
  roles = [snowflake_role.DEV_RAW_DB_VITALS_FULL_AR.name]

  on_future = true
  with_grant_option = false
  enable_multiple_grants = true
  depends_on = [snowflake_schema_grant.grant_ownership_on_dev_raw_db__vitals_schema, snowflake_role_ownership_grant.role_dev_raw_db_vitals_full_ar_ownership_grant, snowflake_stream_grant.grant_ownership_on_dev_raw_db__vitals_streams]
}

resource snowflake_procedure_grant grant_usage_on_dev_raw_db__sparcs_procedures {
  database_name = snowflake_database.DEV_RAW_DB.name
  schema_name = snowflake_schema.DEV_RAW_DB__SPARCS.name
  privilege = "USAGE"
  roles = [snowflake_role.DEV_RAW_DB_SPARCS_R_AR.name, snowflake_role.DEV_RAW_DB_SPARCS_RW_AR.name, snowflake_role.DEV_RAW_DB_SPARCS_FULL_AR.name]
  enable_multiple_grants = true
  on_all = true
  depends_on = [snowflake_schema_grant.grant_ownership_on_dev_raw_db__sparcs_schema, snowflake_role_ownership_grant.role_dev_raw_db_sparcs_r_ar_ownership_grant, snowflake_procedure_grant.grant_ownership_on_dev_raw_db__sparcs_procedures]
}

resource snowflake_procedure_grant grant_usage_on_future_dev_raw_db__sparcs_procedures {
  database_name = snowflake_database.DEV_RAW_DB.name
  schema_name = snowflake_schema.DEV_RAW_DB__SPARCS.name

  privilege = "USAGE"
  roles = [snowflake_role.DEV_RAW_DB_SPARCS_R_AR.name, snowflake_role.DEV_RAW_DB_SPARCS_RW_AR.name, snowflake_role.DEV_RAW_DB_SPARCS_FULL_AR.name]

  on_future = true
  with_grant_option = false
  enable_multiple_grants = true
  depends_on = [snowflake_schema_grant.grant_ownership_on_dev_raw_db__sparcs_schema, snowflake_role_ownership_grant.role_dev_raw_db_sparcs_r_ar_ownership_grant, snowflake_procedure_grant.grant_ownership_on_dev_raw_db__sparcs_procedures]
}

resource snowflake_procedure_grant grant_ownership_on_dev_raw_db__sparcs_procedures {
  database_name = snowflake_database.DEV_RAW_DB.name
  schema_name = snowflake_schema.DEV_RAW_DB__SPARCS.name
  privilege = "OWNERSHIP"
  roles = [snowflake_role.DEV_RAW_DB_SPARCS_FULL_AR.name]
  enable_multiple_grants = true
  on_all = true
  depends_on = [snowflake_schema_grant.grant_ownership_on_dev_raw_db__sparcs_schema, snowflake_role_ownership_grant.role_dev_raw_db_sparcs_full_ar_ownership_grant]
}

resource snowflake_procedure_grant grant_ownership_on_future_dev_raw_db__sparcs_procedures {
  database_name = snowflake_database.DEV_RAW_DB.name
  schema_name = snowflake_schema.DEV_RAW_DB__SPARCS.name

  privilege = "OWNERSHIP"
  roles = [snowflake_role.DEV_RAW_DB_SPARCS_FULL_AR.name]

  on_future = true
  with_grant_option = false
  enable_multiple_grants = true
  depends_on = [snowflake_schema_grant.grant_ownership_on_dev_raw_db__sparcs_schema, snowflake_role_ownership_grant.role_dev_raw_db_sparcs_full_ar_ownership_grant, snowflake_procedure_grant.grant_ownership_on_dev_raw_db__sparcs_procedures]
}

resource snowflake_procedure_grant grant_usage_on_dev_raw_db__vitals_procedures {
  database_name = snowflake_database.DEV_RAW_DB.name
  schema_name = snowflake_schema.DEV_RAW_DB__VITALS.name
  privilege = "USAGE"
  roles = [snowflake_role.DEV_RAW_DB_VITALS_R_AR.name, snowflake_role.DEV_RAW_DB_VITALS_RW_AR.name, snowflake_role.DEV_RAW_DB_VITALS_FULL_AR.name]
  enable_multiple_grants = true
  on_all = true
  depends_on = [snowflake_schema_grant.grant_ownership_on_dev_raw_db__vitals_schema, snowflake_role_ownership_grant.role_dev_raw_db_vitals_r_ar_ownership_grant, snowflake_procedure_grant.grant_ownership_on_dev_raw_db__vitals_procedures]
}

resource snowflake_procedure_grant grant_usage_on_future_dev_raw_db__vitals_procedures {
  database_name = snowflake_database.DEV_RAW_DB.name
  schema_name = snowflake_schema.DEV_RAW_DB__VITALS.name

  privilege = "USAGE"
  roles = [snowflake_role.DEV_RAW_DB_VITALS_R_AR.name, snowflake_role.DEV_RAW_DB_VITALS_RW_AR.name, snowflake_role.DEV_RAW_DB_VITALS_FULL_AR.name]

  on_future = true
  with_grant_option = false
  enable_multiple_grants = true
  depends_on = [snowflake_schema_grant.grant_ownership_on_dev_raw_db__vitals_schema, snowflake_role_ownership_grant.role_dev_raw_db_vitals_r_ar_ownership_grant, snowflake_procedure_grant.grant_ownership_on_dev_raw_db__vitals_procedures]
}

resource snowflake_procedure_grant grant_ownership_on_dev_raw_db__vitals_procedures {
  database_name = snowflake_database.DEV_RAW_DB.name
  schema_name = snowflake_schema.DEV_RAW_DB__VITALS.name
  privilege = "OWNERSHIP"
  roles = [snowflake_role.DEV_RAW_DB_VITALS_FULL_AR.name]
  enable_multiple_grants = true
  on_all = true
  depends_on = [snowflake_schema_grant.grant_ownership_on_dev_raw_db__vitals_schema, snowflake_role_ownership_grant.role_dev_raw_db_vitals_full_ar_ownership_grant]
}

resource snowflake_procedure_grant grant_ownership_on_future_dev_raw_db__vitals_procedures {
  database_name = snowflake_database.DEV_RAW_DB.name
  schema_name = snowflake_schema.DEV_RAW_DB__VITALS.name

  privilege = "OWNERSHIP"
  roles = [snowflake_role.DEV_RAW_DB_VITALS_FULL_AR.name]

  on_future = true
  with_grant_option = false
  enable_multiple_grants = true
  depends_on = [snowflake_schema_grant.grant_ownership_on_dev_raw_db__vitals_schema, snowflake_role_ownership_grant.role_dev_raw_db_vitals_full_ar_ownership_grant, snowflake_procedure_grant.grant_ownership_on_dev_raw_db__vitals_procedures]
}

resource snowflake_function_grant grant_usage_on_dev_raw_db__sparcs_functions {
  database_name = snowflake_database.DEV_RAW_DB.name
  schema_name = snowflake_schema.DEV_RAW_DB__SPARCS.name
  privilege = "USAGE"
  roles = [snowflake_role.DEV_RAW_DB_SPARCS_R_AR.name, snowflake_role.DEV_RAW_DB_SPARCS_RW_AR.name, snowflake_role.DEV_RAW_DB_SPARCS_FULL_AR.name]
  enable_multiple_grants = true
  on_all = true
  depends_on = [snowflake_schema_grant.grant_ownership_on_dev_raw_db__sparcs_schema, snowflake_role_ownership_grant.role_dev_raw_db_sparcs_r_ar_ownership_grant, snowflake_function_grant.grant_ownership_on_dev_raw_db__sparcs_functions]
}

resource snowflake_function_grant grant_usage_on_future_dev_raw_db__sparcs_functions {
  database_name = snowflake_database.DEV_RAW_DB.name
  schema_name = snowflake_schema.DEV_RAW_DB__SPARCS.name

  privilege = "USAGE"
  roles = [snowflake_role.DEV_RAW_DB_SPARCS_R_AR.name, snowflake_role.DEV_RAW_DB_SPARCS_RW_AR.name, snowflake_role.DEV_RAW_DB_SPARCS_FULL_AR.name]

  on_future = true
  with_grant_option = false
  enable_multiple_grants = true
  depends_on = [snowflake_schema_grant.grant_ownership_on_dev_raw_db__sparcs_schema, snowflake_role_ownership_grant.role_dev_raw_db_sparcs_r_ar_ownership_grant, snowflake_function_grant.grant_ownership_on_dev_raw_db__sparcs_functions]
}

resource snowflake_function_grant grant_ownership_on_dev_raw_db__sparcs_functions {
  database_name = snowflake_database.DEV_RAW_DB.name
  schema_name = snowflake_schema.DEV_RAW_DB__SPARCS.name
  privilege = "OWNERSHIP"
  roles = [snowflake_role.DEV_RAW_DB_SPARCS_FULL_AR.name]
  enable_multiple_grants = true
  on_all = true
  depends_on = [snowflake_schema_grant.grant_ownership_on_dev_raw_db__sparcs_schema, snowflake_role_ownership_grant.role_dev_raw_db_sparcs_full_ar_ownership_grant]
}

resource snowflake_function_grant grant_ownership_on_future_dev_raw_db__sparcs_functions {
  database_name = snowflake_database.DEV_RAW_DB.name
  schema_name = snowflake_schema.DEV_RAW_DB__SPARCS.name

  privilege = "OWNERSHIP"
  roles = [snowflake_role.DEV_RAW_DB_SPARCS_FULL_AR.name]

  on_future = true
  with_grant_option = false
  enable_multiple_grants = true
  depends_on = [snowflake_schema_grant.grant_ownership_on_dev_raw_db__sparcs_schema, snowflake_role_ownership_grant.role_dev_raw_db_sparcs_full_ar_ownership_grant, snowflake_function_grant.grant_ownership_on_dev_raw_db__sparcs_functions]
}

resource snowflake_function_grant grant_usage_on_dev_raw_db__vitals_functions {
  database_name = snowflake_database.DEV_RAW_DB.name
  schema_name = snowflake_schema.DEV_RAW_DB__VITALS.name
  privilege = "USAGE"
  roles = [snowflake_role.DEV_RAW_DB_VITALS_R_AR.name, snowflake_role.DEV_RAW_DB_VITALS_RW_AR.name, snowflake_role.DEV_RAW_DB_VITALS_FULL_AR.name]
  enable_multiple_grants = true
  on_all = true
  depends_on = [snowflake_schema_grant.grant_ownership_on_dev_raw_db__vitals_schema, snowflake_role_ownership_grant.role_dev_raw_db_vitals_r_ar_ownership_grant, snowflake_function_grant.grant_ownership_on_dev_raw_db__vitals_functions]
}

resource snowflake_function_grant grant_usage_on_future_dev_raw_db__vitals_functions {
  database_name = snowflake_database.DEV_RAW_DB.name
  schema_name = snowflake_schema.DEV_RAW_DB__VITALS.name

  privilege = "USAGE"
  roles = [snowflake_role.DEV_RAW_DB_VITALS_R_AR.name, snowflake_role.DEV_RAW_DB_VITALS_RW_AR.name, snowflake_role.DEV_RAW_DB_VITALS_FULL_AR.name]

  on_future = true
  with_grant_option = false
  enable_multiple_grants = true
  depends_on = [snowflake_schema_grant.grant_ownership_on_dev_raw_db__vitals_schema, snowflake_role_ownership_grant.role_dev_raw_db_vitals_r_ar_ownership_grant, snowflake_function_grant.grant_ownership_on_dev_raw_db__vitals_functions]
}

resource snowflake_function_grant grant_ownership_on_dev_raw_db__vitals_functions {
  database_name = snowflake_database.DEV_RAW_DB.name
  schema_name = snowflake_schema.DEV_RAW_DB__VITALS.name
  privilege = "OWNERSHIP"
  roles = [snowflake_role.DEV_RAW_DB_VITALS_FULL_AR.name]
  enable_multiple_grants = true
  on_all = true
  depends_on = [snowflake_schema_grant.grant_ownership_on_dev_raw_db__vitals_schema, snowflake_role_ownership_grant.role_dev_raw_db_vitals_full_ar_ownership_grant]
}

resource snowflake_function_grant grant_ownership_on_future_dev_raw_db__vitals_functions {
  database_name = snowflake_database.DEV_RAW_DB.name
  schema_name = snowflake_schema.DEV_RAW_DB__VITALS.name

  privilege = "OWNERSHIP"
  roles = [snowflake_role.DEV_RAW_DB_VITALS_FULL_AR.name]

  on_future = true
  with_grant_option = false
  enable_multiple_grants = true
  depends_on = [snowflake_schema_grant.grant_ownership_on_dev_raw_db__vitals_schema, snowflake_role_ownership_grant.role_dev_raw_db_vitals_full_ar_ownership_grant, snowflake_function_grant.grant_ownership_on_dev_raw_db__vitals_functions]
}

resource snowflake_materialized_view_grant grant_select_on_dev_raw_db__sparcs_materialized_views {
  database_name = snowflake_database.DEV_RAW_DB.name
  schema_name = snowflake_schema.DEV_RAW_DB__SPARCS.name
  privilege = "SELECT"
  roles = [snowflake_role.DEV_RAW_DB_SPARCS_R_AR.name, snowflake_role.DEV_RAW_DB_SPARCS_RW_AR.name, snowflake_role.DEV_RAW_DB_SPARCS_FULL_AR.name]
  enable_multiple_grants = true
  on_all = true
  depends_on = [snowflake_schema_grant.grant_ownership_on_dev_raw_db__sparcs_schema, snowflake_role_ownership_grant.role_dev_raw_db_sparcs_r_ar_ownership_grant, snowflake_materialized_view_grant.grant_ownership_on_dev_raw_db__sparcs_materialized_views]
}

resource snowflake_materialized_view_grant grant_select_on_future_dev_raw_db__sparcs_materialized_views {
  database_name = snowflake_database.DEV_RAW_DB.name
  schema_name = snowflake_schema.DEV_RAW_DB__SPARCS.name

  privilege = "SELECT"
  roles = [snowflake_role.DEV_RAW_DB_SPARCS_R_AR.name, snowflake_role.DEV_RAW_DB_SPARCS_RW_AR.name, snowflake_role.DEV_RAW_DB_SPARCS_FULL_AR.name]

  on_future = true
  with_grant_option = false
  enable_multiple_grants = true
  depends_on = [snowflake_schema_grant.grant_ownership_on_dev_raw_db__sparcs_schema, snowflake_role_ownership_grant.role_dev_raw_db_sparcs_r_ar_ownership_grant, snowflake_materialized_view_grant.grant_ownership_on_dev_raw_db__sparcs_materialized_views]
}

resource snowflake_materialized_view_grant grant_ownership_on_dev_raw_db__sparcs_materialized_views {
  database_name = snowflake_database.DEV_RAW_DB.name
  schema_name = snowflake_schema.DEV_RAW_DB__SPARCS.name
  privilege = "OWNERSHIP"
  roles = [snowflake_role.DEV_RAW_DB_SPARCS_FULL_AR.name]
  enable_multiple_grants = true
  on_all = true
  depends_on = [snowflake_schema_grant.grant_ownership_on_dev_raw_db__sparcs_schema, snowflake_role_ownership_grant.role_dev_raw_db_sparcs_full_ar_ownership_grant]
}

resource snowflake_materialized_view_grant grant_ownership_on_future_dev_raw_db__sparcs_materialized_views {
  database_name = snowflake_database.DEV_RAW_DB.name
  schema_name = snowflake_schema.DEV_RAW_DB__SPARCS.name

  privilege = "OWNERSHIP"
  roles = [snowflake_role.DEV_RAW_DB_SPARCS_FULL_AR.name]

  on_future = true
  with_grant_option = false
  enable_multiple_grants = true
  depends_on = [snowflake_schema_grant.grant_ownership_on_dev_raw_db__sparcs_schema, snowflake_role_ownership_grant.role_dev_raw_db_sparcs_full_ar_ownership_grant, snowflake_materialized_view_grant.grant_ownership_on_dev_raw_db__sparcs_materialized_views]
}

resource snowflake_materialized_view_grant grant_select_on_dev_raw_db__vitals_materialized_views {
  database_name = snowflake_database.DEV_RAW_DB.name
  schema_name = snowflake_schema.DEV_RAW_DB__VITALS.name
  privilege = "SELECT"
  roles = [snowflake_role.DEV_RAW_DB_VITALS_R_AR.name, snowflake_role.DEV_RAW_DB_VITALS_RW_AR.name, snowflake_role.DEV_RAW_DB_VITALS_FULL_AR.name]
  enable_multiple_grants = true
  on_all = true
  depends_on = [snowflake_schema_grant.grant_ownership_on_dev_raw_db__vitals_schema, snowflake_role_ownership_grant.role_dev_raw_db_vitals_r_ar_ownership_grant, snowflake_materialized_view_grant.grant_ownership_on_dev_raw_db__vitals_materialized_views]
}

resource snowflake_materialized_view_grant grant_select_on_future_dev_raw_db__vitals_materialized_views {
  database_name = snowflake_database.DEV_RAW_DB.name
  schema_name = snowflake_schema.DEV_RAW_DB__VITALS.name

  privilege = "SELECT"
  roles = [snowflake_role.DEV_RAW_DB_VITALS_R_AR.name, snowflake_role.DEV_RAW_DB_VITALS_RW_AR.name, snowflake_role.DEV_RAW_DB_VITALS_FULL_AR.name]

  on_future = true
  with_grant_option = false
  enable_multiple_grants = true
  depends_on = [snowflake_schema_grant.grant_ownership_on_dev_raw_db__vitals_schema, snowflake_role_ownership_grant.role_dev_raw_db_vitals_r_ar_ownership_grant, snowflake_materialized_view_grant.grant_ownership_on_dev_raw_db__vitals_materialized_views]
}

resource snowflake_materialized_view_grant grant_ownership_on_dev_raw_db__vitals_materialized_views {
  database_name = snowflake_database.DEV_RAW_DB.name
  schema_name = snowflake_schema.DEV_RAW_DB__VITALS.name
  privilege = "OWNERSHIP"
  roles = [snowflake_role.DEV_RAW_DB_VITALS_FULL_AR.name]
  enable_multiple_grants = true
  on_all = true
  depends_on = [snowflake_schema_grant.grant_ownership_on_dev_raw_db__vitals_schema, snowflake_role_ownership_grant.role_dev_raw_db_vitals_full_ar_ownership_grant]
}

resource snowflake_materialized_view_grant grant_ownership_on_future_dev_raw_db__vitals_materialized_views {
  database_name = snowflake_database.DEV_RAW_DB.name
  schema_name = snowflake_schema.DEV_RAW_DB__VITALS.name

  privilege = "OWNERSHIP"
  roles = [snowflake_role.DEV_RAW_DB_VITALS_FULL_AR.name]

  on_future = true
  with_grant_option = false
  enable_multiple_grants = true
  depends_on = [snowflake_schema_grant.grant_ownership_on_dev_raw_db__vitals_schema, snowflake_role_ownership_grant.role_dev_raw_db_vitals_full_ar_ownership_grant, snowflake_materialized_view_grant.grant_ownership_on_dev_raw_db__vitals_materialized_views]
}

resource snowflake_task_grant grant_monitor_on_dev_raw_db__sparcs_tasks {
  database_name = snowflake_database.DEV_RAW_DB.name
  schema_name = snowflake_schema.DEV_RAW_DB__SPARCS.name
  privilege = "MONITOR"
  roles = [snowflake_role.DEV_RAW_DB_SPARCS_RW_AR.name, snowflake_role.DEV_RAW_DB_SPARCS_FULL_AR.name]
  enable_multiple_grants = true
  on_all = true
  depends_on = [snowflake_schema_grant.grant_ownership_on_dev_raw_db__sparcs_schema, snowflake_role_ownership_grant.role_dev_raw_db_sparcs_rw_ar_ownership_grant, snowflake_task_grant.grant_ownership_on_dev_raw_db__sparcs_tasks]
}

resource snowflake_task_grant grant_operate_on_dev_raw_db__sparcs_tasks {
  database_name = snowflake_database.DEV_RAW_DB.name
  schema_name = snowflake_schema.DEV_RAW_DB__SPARCS.name
  privilege = "OPERATE"
  roles = [snowflake_role.DEV_RAW_DB_SPARCS_RW_AR.name, snowflake_role.DEV_RAW_DB_SPARCS_FULL_AR.name]
  enable_multiple_grants = true
  on_all = true
  depends_on = [snowflake_schema_grant.grant_ownership_on_dev_raw_db__sparcs_schema, snowflake_role_ownership_grant.role_dev_raw_db_sparcs_rw_ar_ownership_grant, snowflake_task_grant.grant_ownership_on_dev_raw_db__sparcs_tasks]
}

resource snowflake_task_grant grant_monitor_on_future_dev_raw_db__sparcs_tasks {
  database_name = snowflake_database.DEV_RAW_DB.name
  schema_name = snowflake_schema.DEV_RAW_DB__SPARCS.name

  privilege = "MONITOR"
  roles = [snowflake_role.DEV_RAW_DB_SPARCS_RW_AR.name, snowflake_role.DEV_RAW_DB_SPARCS_FULL_AR.name]

  on_future = true
  with_grant_option = false
  enable_multiple_grants = true
  depends_on = [snowflake_schema_grant.grant_ownership_on_dev_raw_db__sparcs_schema, snowflake_role_ownership_grant.role_dev_raw_db_sparcs_rw_ar_ownership_grant, snowflake_task_grant.grant_ownership_on_dev_raw_db__sparcs_tasks]
}

resource snowflake_task_grant grant_operate_on_future_dev_raw_db__sparcs_tasks {
  database_name = snowflake_database.DEV_RAW_DB.name
  schema_name = snowflake_schema.DEV_RAW_DB__SPARCS.name

  privilege = "OPERATE"
  roles = [snowflake_role.DEV_RAW_DB_SPARCS_RW_AR.name, snowflake_role.DEV_RAW_DB_SPARCS_FULL_AR.name]

  on_future = true
  with_grant_option = false
  enable_multiple_grants = true
  depends_on = [snowflake_schema_grant.grant_ownership_on_dev_raw_db__sparcs_schema, snowflake_role_ownership_grant.role_dev_raw_db_sparcs_rw_ar_ownership_grant, snowflake_task_grant.grant_ownership_on_dev_raw_db__sparcs_tasks]
}

resource snowflake_task_grant grant_ownership_on_dev_raw_db__sparcs_tasks {
  database_name = snowflake_database.DEV_RAW_DB.name
  schema_name = snowflake_schema.DEV_RAW_DB__SPARCS.name
  privilege = "OWNERSHIP"
  roles = [snowflake_role.DEV_RAW_DB_SPARCS_FULL_AR.name]
  enable_multiple_grants = true
  on_all = true
  depends_on = [snowflake_schema_grant.grant_ownership_on_dev_raw_db__sparcs_schema, snowflake_role_ownership_grant.role_dev_raw_db_sparcs_full_ar_ownership_grant]
}

resource snowflake_task_grant grant_ownership_on_future_dev_raw_db__sparcs_tasks {
  database_name = snowflake_database.DEV_RAW_DB.name
  schema_name = snowflake_schema.DEV_RAW_DB__SPARCS.name

  privilege = "OWNERSHIP"
  roles = [snowflake_role.DEV_RAW_DB_SPARCS_FULL_AR.name]

  on_future = true
  with_grant_option = false
  enable_multiple_grants = true
  depends_on = [snowflake_schema_grant.grant_ownership_on_dev_raw_db__sparcs_schema, snowflake_role_ownership_grant.role_dev_raw_db_sparcs_full_ar_ownership_grant, snowflake_task_grant.grant_ownership_on_dev_raw_db__sparcs_tasks]
}

resource snowflake_task_grant grant_monitor_on_dev_raw_db__vitals_tasks {
  database_name = snowflake_database.DEV_RAW_DB.name
  schema_name = snowflake_schema.DEV_RAW_DB__VITALS.name
  privilege = "MONITOR"
  roles = [snowflake_role.DEV_RAW_DB_VITALS_RW_AR.name, snowflake_role.DEV_RAW_DB_VITALS_FULL_AR.name]
  enable_multiple_grants = true
  on_all = true
  depends_on = [snowflake_schema_grant.grant_ownership_on_dev_raw_db__vitals_schema, snowflake_role_ownership_grant.role_dev_raw_db_vitals_rw_ar_ownership_grant, snowflake_task_grant.grant_ownership_on_dev_raw_db__vitals_tasks]
}

resource snowflake_task_grant grant_operate_on_dev_raw_db__vitals_tasks {
  database_name = snowflake_database.DEV_RAW_DB.name
  schema_name = snowflake_schema.DEV_RAW_DB__VITALS.name
  privilege = "OPERATE"
  roles = [snowflake_role.DEV_RAW_DB_VITALS_RW_AR.name, snowflake_role.DEV_RAW_DB_VITALS_FULL_AR.name]
  enable_multiple_grants = true
  on_all = true
  depends_on = [snowflake_schema_grant.grant_ownership_on_dev_raw_db__vitals_schema, snowflake_role_ownership_grant.role_dev_raw_db_vitals_rw_ar_ownership_grant, snowflake_task_grant.grant_ownership_on_dev_raw_db__vitals_tasks]
}

resource snowflake_task_grant grant_monitor_on_future_dev_raw_db__vitals_tasks {
  database_name = snowflake_database.DEV_RAW_DB.name
  schema_name = snowflake_schema.DEV_RAW_DB__VITALS.name

  privilege = "MONITOR"
  roles = [snowflake_role.DEV_RAW_DB_VITALS_RW_AR.name, snowflake_role.DEV_RAW_DB_VITALS_FULL_AR.name]

  on_future = true
  with_grant_option = false
  enable_multiple_grants = true
  depends_on = [snowflake_schema_grant.grant_ownership_on_dev_raw_db__vitals_schema, snowflake_role_ownership_grant.role_dev_raw_db_vitals_rw_ar_ownership_grant, snowflake_task_grant.grant_ownership_on_dev_raw_db__vitals_tasks]
}

resource snowflake_task_grant grant_operate_on_future_dev_raw_db__vitals_tasks {
  database_name = snowflake_database.DEV_RAW_DB.name
  schema_name = snowflake_schema.DEV_RAW_DB__VITALS.name

  privilege = "OPERATE"
  roles = [snowflake_role.DEV_RAW_DB_VITALS_RW_AR.name, snowflake_role.DEV_RAW_DB_VITALS_FULL_AR.name]

  on_future = true
  with_grant_option = false
  enable_multiple_grants = true
  depends_on = [snowflake_schema_grant.grant_ownership_on_dev_raw_db__vitals_schema, snowflake_role_ownership_grant.role_dev_raw_db_vitals_rw_ar_ownership_grant, snowflake_task_grant.grant_ownership_on_dev_raw_db__vitals_tasks]
}

resource snowflake_task_grant grant_ownership_on_dev_raw_db__vitals_tasks {
  database_name = snowflake_database.DEV_RAW_DB.name
  schema_name = snowflake_schema.DEV_RAW_DB__VITALS.name
  privilege = "OWNERSHIP"
  roles = [snowflake_role.DEV_RAW_DB_VITALS_FULL_AR.name]
  enable_multiple_grants = true
  on_all = true
  depends_on = [snowflake_schema_grant.grant_ownership_on_dev_raw_db__vitals_schema, snowflake_role_ownership_grant.role_dev_raw_db_vitals_full_ar_ownership_grant]
}

resource snowflake_task_grant grant_ownership_on_future_dev_raw_db__vitals_tasks {
  database_name = snowflake_database.DEV_RAW_DB.name
  schema_name = snowflake_schema.DEV_RAW_DB__VITALS.name

  privilege = "OWNERSHIP"
  roles = [snowflake_role.DEV_RAW_DB_VITALS_FULL_AR.name]

  on_future = true
  with_grant_option = false
  enable_multiple_grants = true
  depends_on = [snowflake_schema_grant.grant_ownership_on_dev_raw_db__vitals_schema, snowflake_role_ownership_grant.role_dev_raw_db_vitals_full_ar_ownership_grant, snowflake_task_grant.grant_ownership_on_dev_raw_db__vitals_tasks]
}

resource snowflake_warehouse_grant grant_usage_on_warehouse_dev_raw_compute_wh {
  warehouse_name = snowflake_warehouse.DEV_RAW_COMPUTE_WH.name
  privilege = "USAGE"

  roles = [snowflake_role.DEV_RAW_COMPUTE_WH_U_AR.name, snowflake_role.DEV_RAW_COMPUTE_WH_UM_AR.name]

  with_grant_option = false
  enable_multiple_grants = true
  depends_on = [snowflake_role_ownership_grant.role_dev_raw_compute_wh_u_ar_ownership_grant]
}

resource snowflake_warehouse_grant grant_monitor_on_warehouse_dev_raw_compute_wh {
  warehouse_name = snowflake_warehouse.DEV_RAW_COMPUTE_WH.name
  privilege = "MONITOR"

  roles = [snowflake_role.DEV_RAW_COMPUTE_WH_UM_AR.name]

  with_grant_option = false
  enable_multiple_grants = true
  depends_on = [snowflake_role_ownership_grant.role_dev_raw_compute_wh_um_ar_ownership_grant]
}

resource snowflake_warehouse_grant grant_ownership_on_warehouse_dev_raw_compute_wh {
  warehouse_name = snowflake_warehouse.DEV_RAW_COMPUTE_WH.name
  privilege = "OWNERSHIP"

  roles = [snowflake_role.DEV_RAW_COMPUTE_WH_FULL_AR.name]

  with_grant_option = false
  enable_multiple_grants = true
  depends_on = [snowflake_role_ownership_grant.role_dev_raw_compute_wh_full_ar_ownership_grant]
}

resource snowflake_role_grants role_dev_raw_db_sparcs_r_ar_grants {
  role_name = snowflake_role.DEV_RAW_DB_SPARCS_R_AR.name

  enable_multiple_grants = true
  roles = [
    snowflake_role.DEV_SPARCS_RO_FR.name,
    snowflake_role.DEV_SYSADMIN.name,
  ]
}

resource snowflake_role_grants role_dev_raw_db_sparcs_rw_ar_grants {
  role_name = snowflake_role.DEV_RAW_DB_SPARCS_RW_AR.name

  enable_multiple_grants = true
  roles = [
    snowflake_role.DEV_SPARCS_RW_FR.name,
    snowflake_role.DEV_SYSADMIN.name,
  ]
}

resource snowflake_role_grants role_dev_raw_db_sparcs_full_ar_grants {
  role_name = snowflake_role.DEV_RAW_DB_SPARCS_FULL_AR.name

  enable_multiple_grants = true
  roles = [
    snowflake_role.DEV_SPARCS_FULL_FR.name,
    snowflake_role.DEV_SYSADMIN.name,
  ]
}

resource snowflake_role_grants role_dev_raw_db_vitals_r_ar_grants {
  role_name = snowflake_role.DEV_RAW_DB_VITALS_R_AR.name

  enable_multiple_grants = true
  roles = [
    snowflake_role.DEV_VITALS_RO_FR.name,
    snowflake_role.DEV_SYSADMIN.name,
  ]
}

resource snowflake_role_grants role_dev_raw_db_vitals_rw_ar_grants {
  role_name = snowflake_role.DEV_RAW_DB_VITALS_RW_AR.name

  enable_multiple_grants = true
  roles = [
    snowflake_role.DEV_VITALS_RW_FR.name,
    snowflake_role.DEV_SYSADMIN.name,
  ]
}

resource snowflake_role_grants role_dev_raw_db_vitals_full_ar_grants {
  role_name = snowflake_role.DEV_RAW_DB_VITALS_FULL_AR.name

  enable_multiple_grants = true
  roles = [
    snowflake_role.DEV_VITALS_FULL_FR.name,
    snowflake_role.DEV_SYSADMIN.name,
  ]
}

resource snowflake_role_grants role_dev_raw_compute_wh_u_ar_grants {
  role_name = snowflake_role.DEV_RAW_COMPUTE_WH_U_AR.name

  enable_multiple_grants = true
  roles = [
    snowflake_role.DEV_SYSADMIN.name,
  ]
}

resource snowflake_role_grants role_dev_raw_compute_wh_um_ar_grants {
  role_name = snowflake_role.DEV_RAW_COMPUTE_WH_UM_AR.name

  enable_multiple_grants = true
  roles = [
    snowflake_role.DEV_SYSADMIN.name,
  ]
}

resource snowflake_role_grants role_dev_raw_compute_wh_full_ar_grants {
  role_name = snowflake_role.DEV_RAW_COMPUTE_WH_FULL_AR.name

  enable_multiple_grants = true
  roles = [
    snowflake_role.DEV_SYSADMIN.name,
  ]
}

resource snowflake_role DEV_SYSADMIN {
  name = "DEV_SYSADMIN"
}

resource snowflake_role_grants role_dev_sysadmin_grants {
  role_name = snowflake_role.DEV_SYSADMIN.name

  enable_multiple_grants = true
  roles = [
    "SYSADMIN",
  ]
}

resource snowflake_database_grant grant_ownership_on_dev_raw_db_database {
  database_name = snowflake_database.DEV_RAW_DB.name
  privilege = "OWNERSHIP"
  roles = [snowflake_role.DEV_SYSADMIN.name]

  with_grant_option = false
  enable_multiple_grants = true
  depends_on = [snowflake_role_grants.role_dev_sysadmin_grants]
}

resource snowflake_role PROD_RAW_DB_SPARCS_R_AR {
  name = "PROD_RAW_DB_SPARCS_R_AR"
}

resource snowflake_role_ownership_grant role_prod_raw_db_sparcs_r_ar_ownership_grant {
  on_role_name = snowflake_role.PROD_RAW_DB_SPARCS_R_AR.name
  to_role_name = "USERADMIN"
  revert_ownership_to_role_name = "SYSADMIN"
}

resource snowflake_role PROD_RAW_DB_SPARCS_RW_AR {
  name = "PROD_RAW_DB_SPARCS_RW_AR"
}

resource snowflake_role_ownership_grant role_prod_raw_db_sparcs_rw_ar_ownership_grant {
  on_role_name = snowflake_role.PROD_RAW_DB_SPARCS_RW_AR.name
  to_role_name = "USERADMIN"
  revert_ownership_to_role_name = "SYSADMIN"
}

resource snowflake_role PROD_RAW_DB_SPARCS_FULL_AR {
  name = "PROD_RAW_DB_SPARCS_FULL_AR"
}

resource snowflake_role_ownership_grant role_prod_raw_db_sparcs_full_ar_ownership_grant {
  on_role_name = snowflake_role.PROD_RAW_DB_SPARCS_FULL_AR.name
  to_role_name = "USERADMIN"
  revert_ownership_to_role_name = "SYSADMIN"
}

resource snowflake_role PROD_RAW_DB_VITALS_R_AR {
  name = "PROD_RAW_DB_VITALS_R_AR"
}

resource snowflake_role_ownership_grant role_prod_raw_db_vitals_r_ar_ownership_grant {
  on_role_name = snowflake_role.PROD_RAW_DB_VITALS_R_AR.name
  to_role_name = "USERADMIN"
  revert_ownership_to_role_name = "SYSADMIN"
}

resource snowflake_role PROD_RAW_DB_VITALS_RW_AR {
  name = "PROD_RAW_DB_VITALS_RW_AR"
}

resource snowflake_role_ownership_grant role_prod_raw_db_vitals_rw_ar_ownership_grant {
  on_role_name = snowflake_role.PROD_RAW_DB_VITALS_RW_AR.name
  to_role_name = "USERADMIN"
  revert_ownership_to_role_name = "SYSADMIN"
}

resource snowflake_role PROD_RAW_DB_VITALS_FULL_AR {
  name = "PROD_RAW_DB_VITALS_FULL_AR"
}

resource snowflake_role_ownership_grant role_prod_raw_db_vitals_full_ar_ownership_grant {
  on_role_name = snowflake_role.PROD_RAW_DB_VITALS_FULL_AR.name
  to_role_name = "USERADMIN"
  revert_ownership_to_role_name = "SYSADMIN"
}

resource snowflake_role PROD_RAW_COMPUTE_WH_U_AR {
  name = "PROD_RAW_COMPUTE_WH_U_AR"
}

resource snowflake_role_ownership_grant role_prod_raw_compute_wh_u_ar_ownership_grant {
  on_role_name = snowflake_role.PROD_RAW_COMPUTE_WH_U_AR.name
  to_role_name = "USERADMIN"
  revert_ownership_to_role_name = "SYSADMIN"
}

resource snowflake_role PROD_RAW_COMPUTE_WH_UM_AR {
  name = "PROD_RAW_COMPUTE_WH_UM_AR"
}

resource snowflake_role_ownership_grant role_prod_raw_compute_wh_um_ar_ownership_grant {
  on_role_name = snowflake_role.PROD_RAW_COMPUTE_WH_UM_AR.name
  to_role_name = "USERADMIN"
  revert_ownership_to_role_name = "SYSADMIN"
}

resource snowflake_role PROD_RAW_COMPUTE_WH_FULL_AR {
  name = "PROD_RAW_COMPUTE_WH_FULL_AR"
}

resource snowflake_role_ownership_grant role_prod_raw_compute_wh_full_ar_ownership_grant {
  on_role_name = snowflake_role.PROD_RAW_COMPUTE_WH_FULL_AR.name
  to_role_name = "USERADMIN"
  revert_ownership_to_role_name = "SYSADMIN"
}

resource snowflake_database_grant grant_usage_on_prod_raw_db_database {
  database_name = snowflake_database.PROD_RAW_DB.name
  privilege = "USAGE"
  roles = ["PROD_RAW_DB_SPARCS_R_AR", "PROD_RAW_DB_SPARCS_RW_AR", "PROD_RAW_DB_SPARCS_FULL_AR", "PROD_RAW_DB_SPARCS_FULL_AR", "PROD_RAW_DB_VITALS_R_AR", "PROD_RAW_DB_VITALS_RW_AR", "PROD_RAW_DB_VITALS_FULL_AR", "PROD_RAW_DB_VITALS_FULL_AR"]

  with_grant_option = false
  enable_multiple_grants = true
  depends_on = [snowflake_role_ownership_grant.role_prod_raw_db_sparcs_r_ar_ownership_grant]
}

resource snowflake_schema_grant grant_usage_on_prod_raw_db__sparcs_schema {
  database_name = snowflake_database.PROD_RAW_DB.name
  schema_name = snowflake_schema.PROD_RAW_DB__SPARCS.name

  privilege = "USAGE"
  roles = [snowflake_role.PROD_RAW_DB_SPARCS_R_AR.name, snowflake_role.PROD_RAW_DB_SPARCS_RW_AR.name, snowflake_role.PROD_RAW_DB_SPARCS_FULL_AR.name, snowflake_role.PROD_RAW_DB_SPARCS_FULL_AR.name]

  depends_on = [snowflake_role_grants.role_prod_raw_db_sparcs_r_ar_grants, snowflake_role_grants.role_prod_raw_db_sparcs_rw_ar_grants, snowflake_role_grants.role_prod_raw_db_sparcs_full_ar_grants, snowflake_role_grants.role_prod_raw_db_sparcs_full_ar_grants, snowflake_role_ownership_grant.role_prod_raw_db_sparcs_r_ar_ownership_grant]

  with_grant_option = false
  enable_multiple_grants = true
}

resource snowflake_schema_grant grant_ownership_on_prod_raw_db__sparcs_schema {
  database_name = snowflake_database.PROD_RAW_DB.name
  schema_name = snowflake_schema.PROD_RAW_DB__SPARCS.name

  privilege = "OWNERSHIP"
  roles = [snowflake_role.PROD_RAW_DB_SPARCS_FULL_AR.name]

  depends_on = [snowflake_role_grants.role_prod_raw_db_sparcs_full_ar_grants, snowflake_role_ownership_grant.role_prod_raw_db_sparcs_full_ar_ownership_grant]

  with_grant_option = false
  enable_multiple_grants = true
}

resource snowflake_schema_grant grant_usage_on_prod_raw_db__vitals_schema {
  database_name = snowflake_database.PROD_RAW_DB.name
  schema_name = snowflake_schema.PROD_RAW_DB__VITALS.name

  privilege = "USAGE"
  roles = [snowflake_role.PROD_RAW_DB_VITALS_R_AR.name, snowflake_role.PROD_RAW_DB_VITALS_RW_AR.name, snowflake_role.PROD_RAW_DB_VITALS_FULL_AR.name, snowflake_role.PROD_RAW_DB_VITALS_FULL_AR.name]

  depends_on = [snowflake_role_grants.role_prod_raw_db_vitals_r_ar_grants, snowflake_role_grants.role_prod_raw_db_vitals_rw_ar_grants, snowflake_role_grants.role_prod_raw_db_vitals_full_ar_grants, snowflake_role_grants.role_prod_raw_db_vitals_full_ar_grants, snowflake_role_ownership_grant.role_prod_raw_db_vitals_r_ar_ownership_grant]

  with_grant_option = false
  enable_multiple_grants = true
}

resource snowflake_schema_grant grant_ownership_on_prod_raw_db__vitals_schema {
  database_name = snowflake_database.PROD_RAW_DB.name
  schema_name = snowflake_schema.PROD_RAW_DB__VITALS.name

  privilege = "OWNERSHIP"
  roles = [snowflake_role.PROD_RAW_DB_VITALS_FULL_AR.name]

  depends_on = [snowflake_role_grants.role_prod_raw_db_vitals_full_ar_grants, snowflake_role_ownership_grant.role_prod_raw_db_vitals_full_ar_ownership_grant]

  with_grant_option = false
  enable_multiple_grants = true
}

resource snowflake_table_grant grant_select_on_prod_raw_db__sparcs_tables {
  database_name = snowflake_database.PROD_RAW_DB.name
  schema_name = snowflake_schema.PROD_RAW_DB__SPARCS.name
  privilege = "SELECT"
  roles = [snowflake_role.PROD_RAW_DB_SPARCS_R_AR.name, snowflake_role.PROD_RAW_DB_SPARCS_RW_AR.name, snowflake_role.PROD_RAW_DB_SPARCS_FULL_AR.name]
  enable_multiple_grants = true
  on_all = true
  depends_on = [snowflake_schema_grant.grant_ownership_on_prod_raw_db__sparcs_schema, snowflake_role_ownership_grant.role_prod_raw_db_sparcs_r_ar_ownership_grant, snowflake_table_grant.grant_ownership_on_prod_raw_db__sparcs_tables]
}

resource snowflake_table_grant grant_select_on_future_prod_raw_db__sparcs_tables {
  database_name = snowflake_database.PROD_RAW_DB.name
  schema_name = snowflake_schema.PROD_RAW_DB__SPARCS.name

  privilege = "SELECT"
  roles = [snowflake_role.PROD_RAW_DB_SPARCS_R_AR.name, snowflake_role.PROD_RAW_DB_SPARCS_RW_AR.name, snowflake_role.PROD_RAW_DB_SPARCS_FULL_AR.name]

  on_future = true
  with_grant_option = false
  enable_multiple_grants = true
  depends_on = [snowflake_schema_grant.grant_ownership_on_prod_raw_db__sparcs_schema, snowflake_role_ownership_grant.role_prod_raw_db_sparcs_r_ar_ownership_grant, snowflake_table_grant.grant_ownership_on_prod_raw_db__sparcs_tables]
}

resource snowflake_table_grant grant_insert_on_prod_raw_db__sparcs_tables {
  database_name = snowflake_database.PROD_RAW_DB.name
  schema_name = snowflake_schema.PROD_RAW_DB__SPARCS.name
  privilege = "INSERT"
  roles = [snowflake_role.PROD_RAW_DB_SPARCS_RW_AR.name, snowflake_role.PROD_RAW_DB_SPARCS_FULL_AR.name]
  enable_multiple_grants = true
  on_all = true
  depends_on = [snowflake_schema_grant.grant_ownership_on_prod_raw_db__sparcs_schema, snowflake_role_ownership_grant.role_prod_raw_db_sparcs_rw_ar_ownership_grant, snowflake_table_grant.grant_ownership_on_prod_raw_db__sparcs_tables]
}

resource snowflake_table_grant grant_update_on_prod_raw_db__sparcs_tables {
  database_name = snowflake_database.PROD_RAW_DB.name
  schema_name = snowflake_schema.PROD_RAW_DB__SPARCS.name
  privilege = "UPDATE"
  roles = [snowflake_role.PROD_RAW_DB_SPARCS_RW_AR.name, snowflake_role.PROD_RAW_DB_SPARCS_FULL_AR.name]
  enable_multiple_grants = true
  on_all = true
  depends_on = [snowflake_schema_grant.grant_ownership_on_prod_raw_db__sparcs_schema, snowflake_role_ownership_grant.role_prod_raw_db_sparcs_rw_ar_ownership_grant, snowflake_table_grant.grant_ownership_on_prod_raw_db__sparcs_tables]
}

resource snowflake_table_grant grant_delete_on_prod_raw_db__sparcs_tables {
  database_name = snowflake_database.PROD_RAW_DB.name
  schema_name = snowflake_schema.PROD_RAW_DB__SPARCS.name
  privilege = "DELETE"
  roles = [snowflake_role.PROD_RAW_DB_SPARCS_RW_AR.name, snowflake_role.PROD_RAW_DB_SPARCS_FULL_AR.name]
  enable_multiple_grants = true
  on_all = true
  depends_on = [snowflake_schema_grant.grant_ownership_on_prod_raw_db__sparcs_schema, snowflake_role_ownership_grant.role_prod_raw_db_sparcs_rw_ar_ownership_grant, snowflake_table_grant.grant_ownership_on_prod_raw_db__sparcs_tables]
}

resource snowflake_table_grant grant_references_on_prod_raw_db__sparcs_tables {
  database_name = snowflake_database.PROD_RAW_DB.name
  schema_name = snowflake_schema.PROD_RAW_DB__SPARCS.name
  privilege = "REFERENCES"
  roles = [snowflake_role.PROD_RAW_DB_SPARCS_RW_AR.name, snowflake_role.PROD_RAW_DB_SPARCS_FULL_AR.name]
  enable_multiple_grants = true
  on_all = true
  depends_on = [snowflake_schema_grant.grant_ownership_on_prod_raw_db__sparcs_schema, snowflake_role_ownership_grant.role_prod_raw_db_sparcs_rw_ar_ownership_grant, snowflake_table_grant.grant_ownership_on_prod_raw_db__sparcs_tables]
}

resource snowflake_table_grant grant_insert_on_future_prod_raw_db__sparcs_tables {
  database_name = snowflake_database.PROD_RAW_DB.name
  schema_name = snowflake_schema.PROD_RAW_DB__SPARCS.name

  privilege = "INSERT"
  roles = [snowflake_role.PROD_RAW_DB_SPARCS_RW_AR.name, snowflake_role.PROD_RAW_DB_SPARCS_FULL_AR.name]

  on_future = true
  with_grant_option = false
  enable_multiple_grants = true
  depends_on = [snowflake_schema_grant.grant_ownership_on_prod_raw_db__sparcs_schema, snowflake_role_ownership_grant.role_prod_raw_db_sparcs_rw_ar_ownership_grant, snowflake_table_grant.grant_ownership_on_prod_raw_db__sparcs_tables]
}

resource snowflake_table_grant grant_update_on_future_prod_raw_db__sparcs_tables {
  database_name = snowflake_database.PROD_RAW_DB.name
  schema_name = snowflake_schema.PROD_RAW_DB__SPARCS.name

  privilege = "UPDATE"
  roles = [snowflake_role.PROD_RAW_DB_SPARCS_RW_AR.name, snowflake_role.PROD_RAW_DB_SPARCS_FULL_AR.name]

  on_future = true
  with_grant_option = false
  enable_multiple_grants = true
  depends_on = [snowflake_schema_grant.grant_ownership_on_prod_raw_db__sparcs_schema, snowflake_role_ownership_grant.role_prod_raw_db_sparcs_rw_ar_ownership_grant, snowflake_table_grant.grant_ownership_on_prod_raw_db__sparcs_tables]
}

resource snowflake_table_grant grant_delete_on_future_prod_raw_db__sparcs_tables {
  database_name = snowflake_database.PROD_RAW_DB.name
  schema_name = snowflake_schema.PROD_RAW_DB__SPARCS.name

  privilege = "DELETE"
  roles = [snowflake_role.PROD_RAW_DB_SPARCS_RW_AR.name, snowflake_role.PROD_RAW_DB_SPARCS_FULL_AR.name]

  on_future = true
  with_grant_option = false
  enable_multiple_grants = true
  depends_on = [snowflake_schema_grant.grant_ownership_on_prod_raw_db__sparcs_schema, snowflake_role_ownership_grant.role_prod_raw_db_sparcs_rw_ar_ownership_grant, snowflake_table_grant.grant_ownership_on_prod_raw_db__sparcs_tables]
}

resource snowflake_table_grant grant_references_on_future_prod_raw_db__sparcs_tables {
  database_name = snowflake_database.PROD_RAW_DB.name
  schema_name = snowflake_schema.PROD_RAW_DB__SPARCS.name

  privilege = "REFERENCES"
  roles = [snowflake_role.PROD_RAW_DB_SPARCS_RW_AR.name, snowflake_role.PROD_RAW_DB_SPARCS_FULL_AR.name]

  on_future = true
  with_grant_option = false
  enable_multiple_grants = true
  depends_on = [snowflake_schema_grant.grant_ownership_on_prod_raw_db__sparcs_schema, snowflake_role_ownership_grant.role_prod_raw_db_sparcs_rw_ar_ownership_grant, snowflake_table_grant.grant_ownership_on_prod_raw_db__sparcs_tables]
}

resource snowflake_table_grant grant_ownership_on_prod_raw_db__sparcs_tables {
  database_name = snowflake_database.PROD_RAW_DB.name
  schema_name = snowflake_schema.PROD_RAW_DB__SPARCS.name
  privilege = "OWNERSHIP"
  roles = [snowflake_role.PROD_RAW_DB_SPARCS_FULL_AR.name]
  enable_multiple_grants = true
  on_all = true
  depends_on = [snowflake_schema_grant.grant_ownership_on_prod_raw_db__sparcs_schema, snowflake_role_ownership_grant.role_prod_raw_db_sparcs_full_ar_ownership_grant]
}

resource snowflake_table_grant grant_ownership_on_future_prod_raw_db__sparcs_tables {
  database_name = snowflake_database.PROD_RAW_DB.name
  schema_name = snowflake_schema.PROD_RAW_DB__SPARCS.name

  privilege = "OWNERSHIP"
  roles = [snowflake_role.PROD_RAW_DB_SPARCS_FULL_AR.name]

  on_future = true
  with_grant_option = false
  enable_multiple_grants = true
  depends_on = [snowflake_schema_grant.grant_ownership_on_prod_raw_db__sparcs_schema, snowflake_role_ownership_grant.role_prod_raw_db_sparcs_full_ar_ownership_grant, snowflake_table_grant.grant_ownership_on_prod_raw_db__sparcs_tables]
}

resource snowflake_table_grant grant_select_on_prod_raw_db__vitals_tables {
  database_name = snowflake_database.PROD_RAW_DB.name
  schema_name = snowflake_schema.PROD_RAW_DB__VITALS.name
  privilege = "SELECT"
  roles = [snowflake_role.PROD_RAW_DB_VITALS_R_AR.name, snowflake_role.PROD_RAW_DB_VITALS_RW_AR.name, snowflake_role.PROD_RAW_DB_VITALS_FULL_AR.name]
  enable_multiple_grants = true
  on_all = true
  depends_on = [snowflake_schema_grant.grant_ownership_on_prod_raw_db__vitals_schema, snowflake_role_ownership_grant.role_prod_raw_db_vitals_r_ar_ownership_grant, snowflake_table_grant.grant_ownership_on_prod_raw_db__vitals_tables]
}

resource snowflake_table_grant grant_select_on_future_prod_raw_db__vitals_tables {
  database_name = snowflake_database.PROD_RAW_DB.name
  schema_name = snowflake_schema.PROD_RAW_DB__VITALS.name

  privilege = "SELECT"
  roles = [snowflake_role.PROD_RAW_DB_VITALS_R_AR.name, snowflake_role.PROD_RAW_DB_VITALS_RW_AR.name, snowflake_role.PROD_RAW_DB_VITALS_FULL_AR.name]

  on_future = true
  with_grant_option = false
  enable_multiple_grants = true
  depends_on = [snowflake_schema_grant.grant_ownership_on_prod_raw_db__vitals_schema, snowflake_role_ownership_grant.role_prod_raw_db_vitals_r_ar_ownership_grant, snowflake_table_grant.grant_ownership_on_prod_raw_db__vitals_tables]
}

resource snowflake_table_grant grant_insert_on_prod_raw_db__vitals_tables {
  database_name = snowflake_database.PROD_RAW_DB.name
  schema_name = snowflake_schema.PROD_RAW_DB__VITALS.name
  privilege = "INSERT"
  roles = [snowflake_role.PROD_RAW_DB_VITALS_RW_AR.name, snowflake_role.PROD_RAW_DB_VITALS_FULL_AR.name]
  enable_multiple_grants = true
  on_all = true
  depends_on = [snowflake_schema_grant.grant_ownership_on_prod_raw_db__vitals_schema, snowflake_role_ownership_grant.role_prod_raw_db_vitals_rw_ar_ownership_grant, snowflake_table_grant.grant_ownership_on_prod_raw_db__vitals_tables]
}

resource snowflake_table_grant grant_update_on_prod_raw_db__vitals_tables {
  database_name = snowflake_database.PROD_RAW_DB.name
  schema_name = snowflake_schema.PROD_RAW_DB__VITALS.name
  privilege = "UPDATE"
  roles = [snowflake_role.PROD_RAW_DB_VITALS_RW_AR.name, snowflake_role.PROD_RAW_DB_VITALS_FULL_AR.name]
  enable_multiple_grants = true
  on_all = true
  depends_on = [snowflake_schema_grant.grant_ownership_on_prod_raw_db__vitals_schema, snowflake_role_ownership_grant.role_prod_raw_db_vitals_rw_ar_ownership_grant, snowflake_table_grant.grant_ownership_on_prod_raw_db__vitals_tables]
}

resource snowflake_table_grant grant_delete_on_prod_raw_db__vitals_tables {
  database_name = snowflake_database.PROD_RAW_DB.name
  schema_name = snowflake_schema.PROD_RAW_DB__VITALS.name
  privilege = "DELETE"
  roles = [snowflake_role.PROD_RAW_DB_VITALS_RW_AR.name, snowflake_role.PROD_RAW_DB_VITALS_FULL_AR.name]
  enable_multiple_grants = true
  on_all = true
  depends_on = [snowflake_schema_grant.grant_ownership_on_prod_raw_db__vitals_schema, snowflake_role_ownership_grant.role_prod_raw_db_vitals_rw_ar_ownership_grant, snowflake_table_grant.grant_ownership_on_prod_raw_db__vitals_tables]
}

resource snowflake_table_grant grant_references_on_prod_raw_db__vitals_tables {
  database_name = snowflake_database.PROD_RAW_DB.name
  schema_name = snowflake_schema.PROD_RAW_DB__VITALS.name
  privilege = "REFERENCES"
  roles = [snowflake_role.PROD_RAW_DB_VITALS_RW_AR.name, snowflake_role.PROD_RAW_DB_VITALS_FULL_AR.name]
  enable_multiple_grants = true
  on_all = true
  depends_on = [snowflake_schema_grant.grant_ownership_on_prod_raw_db__vitals_schema, snowflake_role_ownership_grant.role_prod_raw_db_vitals_rw_ar_ownership_grant, snowflake_table_grant.grant_ownership_on_prod_raw_db__vitals_tables]
}

resource snowflake_table_grant grant_insert_on_future_prod_raw_db__vitals_tables {
  database_name = snowflake_database.PROD_RAW_DB.name
  schema_name = snowflake_schema.PROD_RAW_DB__VITALS.name

  privilege = "INSERT"
  roles = [snowflake_role.PROD_RAW_DB_VITALS_RW_AR.name, snowflake_role.PROD_RAW_DB_VITALS_FULL_AR.name]

  on_future = true
  with_grant_option = false
  enable_multiple_grants = true
  depends_on = [snowflake_schema_grant.grant_ownership_on_prod_raw_db__vitals_schema, snowflake_role_ownership_grant.role_prod_raw_db_vitals_rw_ar_ownership_grant, snowflake_table_grant.grant_ownership_on_prod_raw_db__vitals_tables]
}

resource snowflake_table_grant grant_update_on_future_prod_raw_db__vitals_tables {
  database_name = snowflake_database.PROD_RAW_DB.name
  schema_name = snowflake_schema.PROD_RAW_DB__VITALS.name

  privilege = "UPDATE"
  roles = [snowflake_role.PROD_RAW_DB_VITALS_RW_AR.name, snowflake_role.PROD_RAW_DB_VITALS_FULL_AR.name]

  on_future = true
  with_grant_option = false
  enable_multiple_grants = true
  depends_on = [snowflake_schema_grant.grant_ownership_on_prod_raw_db__vitals_schema, snowflake_role_ownership_grant.role_prod_raw_db_vitals_rw_ar_ownership_grant, snowflake_table_grant.grant_ownership_on_prod_raw_db__vitals_tables]
}

resource snowflake_table_grant grant_delete_on_future_prod_raw_db__vitals_tables {
  database_name = snowflake_database.PROD_RAW_DB.name
  schema_name = snowflake_schema.PROD_RAW_DB__VITALS.name

  privilege = "DELETE"
  roles = [snowflake_role.PROD_RAW_DB_VITALS_RW_AR.name, snowflake_role.PROD_RAW_DB_VITALS_FULL_AR.name]

  on_future = true
  with_grant_option = false
  enable_multiple_grants = true
  depends_on = [snowflake_schema_grant.grant_ownership_on_prod_raw_db__vitals_schema, snowflake_role_ownership_grant.role_prod_raw_db_vitals_rw_ar_ownership_grant, snowflake_table_grant.grant_ownership_on_prod_raw_db__vitals_tables]
}

resource snowflake_table_grant grant_references_on_future_prod_raw_db__vitals_tables {
  database_name = snowflake_database.PROD_RAW_DB.name
  schema_name = snowflake_schema.PROD_RAW_DB__VITALS.name

  privilege = "REFERENCES"
  roles = [snowflake_role.PROD_RAW_DB_VITALS_RW_AR.name, snowflake_role.PROD_RAW_DB_VITALS_FULL_AR.name]

  on_future = true
  with_grant_option = false
  enable_multiple_grants = true
  depends_on = [snowflake_schema_grant.grant_ownership_on_prod_raw_db__vitals_schema, snowflake_role_ownership_grant.role_prod_raw_db_vitals_rw_ar_ownership_grant, snowflake_table_grant.grant_ownership_on_prod_raw_db__vitals_tables]
}

resource snowflake_table_grant grant_ownership_on_prod_raw_db__vitals_tables {
  database_name = snowflake_database.PROD_RAW_DB.name
  schema_name = snowflake_schema.PROD_RAW_DB__VITALS.name
  privilege = "OWNERSHIP"
  roles = [snowflake_role.PROD_RAW_DB_VITALS_FULL_AR.name]
  enable_multiple_grants = true
  on_all = true
  depends_on = [snowflake_schema_grant.grant_ownership_on_prod_raw_db__vitals_schema, snowflake_role_ownership_grant.role_prod_raw_db_vitals_full_ar_ownership_grant]
}

resource snowflake_table_grant grant_ownership_on_future_prod_raw_db__vitals_tables {
  database_name = snowflake_database.PROD_RAW_DB.name
  schema_name = snowflake_schema.PROD_RAW_DB__VITALS.name

  privilege = "OWNERSHIP"
  roles = [snowflake_role.PROD_RAW_DB_VITALS_FULL_AR.name]

  on_future = true
  with_grant_option = false
  enable_multiple_grants = true
  depends_on = [snowflake_schema_grant.grant_ownership_on_prod_raw_db__vitals_schema, snowflake_role_ownership_grant.role_prod_raw_db_vitals_full_ar_ownership_grant, snowflake_table_grant.grant_ownership_on_prod_raw_db__vitals_tables]
}

resource snowflake_view_grant grant_select_on_prod_raw_db__sparcs_views {
  database_name = snowflake_database.PROD_RAW_DB.name
  schema_name = snowflake_schema.PROD_RAW_DB__SPARCS.name
  privilege = "SELECT"
  roles = [snowflake_role.PROD_RAW_DB_SPARCS_R_AR.name, snowflake_role.PROD_RAW_DB_SPARCS_RW_AR.name, snowflake_role.PROD_RAW_DB_SPARCS_FULL_AR.name]
  enable_multiple_grants = true
  on_all = true
  depends_on = [snowflake_schema_grant.grant_ownership_on_prod_raw_db__sparcs_schema, snowflake_role_ownership_grant.role_prod_raw_db_sparcs_r_ar_ownership_grant, snowflake_view_grant.grant_ownership_on_prod_raw_db__sparcs_views]
}

resource snowflake_view_grant grant_select_on_future_prod_raw_db__sparcs_views {
  database_name = snowflake_database.PROD_RAW_DB.name
  schema_name = snowflake_schema.PROD_RAW_DB__SPARCS.name

  privilege = "SELECT"
  roles = [snowflake_role.PROD_RAW_DB_SPARCS_R_AR.name, snowflake_role.PROD_RAW_DB_SPARCS_RW_AR.name, snowflake_role.PROD_RAW_DB_SPARCS_FULL_AR.name]

  on_future = true
  with_grant_option = false
  enable_multiple_grants = true
  depends_on = [snowflake_schema_grant.grant_ownership_on_prod_raw_db__sparcs_schema, snowflake_role_ownership_grant.role_prod_raw_db_sparcs_r_ar_ownership_grant, snowflake_view_grant.grant_ownership_on_prod_raw_db__sparcs_views]
}

resource snowflake_view_grant grant_ownership_on_prod_raw_db__sparcs_views {
  database_name = snowflake_database.PROD_RAW_DB.name
  schema_name = snowflake_schema.PROD_RAW_DB__SPARCS.name
  privilege = "OWNERSHIP"
  roles = [snowflake_role.PROD_RAW_DB_SPARCS_FULL_AR.name]
  enable_multiple_grants = true
  on_all = true
  depends_on = [snowflake_schema_grant.grant_ownership_on_prod_raw_db__sparcs_schema, snowflake_role_ownership_grant.role_prod_raw_db_sparcs_full_ar_ownership_grant]
}

resource snowflake_view_grant grant_ownership_on_future_prod_raw_db__sparcs_views {
  database_name = snowflake_database.PROD_RAW_DB.name
  schema_name = snowflake_schema.PROD_RAW_DB__SPARCS.name

  privilege = "OWNERSHIP"
  roles = [snowflake_role.PROD_RAW_DB_SPARCS_FULL_AR.name]

  on_future = true
  with_grant_option = false
  enable_multiple_grants = true
  depends_on = [snowflake_schema_grant.grant_ownership_on_prod_raw_db__sparcs_schema, snowflake_role_ownership_grant.role_prod_raw_db_sparcs_full_ar_ownership_grant, snowflake_view_grant.grant_ownership_on_prod_raw_db__sparcs_views]
}

resource snowflake_view_grant grant_select_on_prod_raw_db__vitals_views {
  database_name = snowflake_database.PROD_RAW_DB.name
  schema_name = snowflake_schema.PROD_RAW_DB__VITALS.name
  privilege = "SELECT"
  roles = [snowflake_role.PROD_RAW_DB_VITALS_R_AR.name, snowflake_role.PROD_RAW_DB_VITALS_RW_AR.name, snowflake_role.PROD_RAW_DB_VITALS_FULL_AR.name]
  enable_multiple_grants = true
  on_all = true
  depends_on = [snowflake_schema_grant.grant_ownership_on_prod_raw_db__vitals_schema, snowflake_role_ownership_grant.role_prod_raw_db_vitals_r_ar_ownership_grant, snowflake_view_grant.grant_ownership_on_prod_raw_db__vitals_views]
}

resource snowflake_view_grant grant_select_on_future_prod_raw_db__vitals_views {
  database_name = snowflake_database.PROD_RAW_DB.name
  schema_name = snowflake_schema.PROD_RAW_DB__VITALS.name

  privilege = "SELECT"
  roles = [snowflake_role.PROD_RAW_DB_VITALS_R_AR.name, snowflake_role.PROD_RAW_DB_VITALS_RW_AR.name, snowflake_role.PROD_RAW_DB_VITALS_FULL_AR.name]

  on_future = true
  with_grant_option = false
  enable_multiple_grants = true
  depends_on = [snowflake_schema_grant.grant_ownership_on_prod_raw_db__vitals_schema, snowflake_role_ownership_grant.role_prod_raw_db_vitals_r_ar_ownership_grant, snowflake_view_grant.grant_ownership_on_prod_raw_db__vitals_views]
}

resource snowflake_view_grant grant_ownership_on_prod_raw_db__vitals_views {
  database_name = snowflake_database.PROD_RAW_DB.name
  schema_name = snowflake_schema.PROD_RAW_DB__VITALS.name
  privilege = "OWNERSHIP"
  roles = [snowflake_role.PROD_RAW_DB_VITALS_FULL_AR.name]
  enable_multiple_grants = true
  on_all = true
  depends_on = [snowflake_schema_grant.grant_ownership_on_prod_raw_db__vitals_schema, snowflake_role_ownership_grant.role_prod_raw_db_vitals_full_ar_ownership_grant]
}

resource snowflake_view_grant grant_ownership_on_future_prod_raw_db__vitals_views {
  database_name = snowflake_database.PROD_RAW_DB.name
  schema_name = snowflake_schema.PROD_RAW_DB__VITALS.name

  privilege = "OWNERSHIP"
  roles = [snowflake_role.PROD_RAW_DB_VITALS_FULL_AR.name]

  on_future = true
  with_grant_option = false
  enable_multiple_grants = true
  depends_on = [snowflake_schema_grant.grant_ownership_on_prod_raw_db__vitals_schema, snowflake_role_ownership_grant.role_prod_raw_db_vitals_full_ar_ownership_grant, snowflake_view_grant.grant_ownership_on_prod_raw_db__vitals_views]
}

resource snowflake_sequence_grant grant_usage_on_prod_raw_db__sparcs_sequences {
  database_name = snowflake_database.PROD_RAW_DB.name
  schema_name = snowflake_schema.PROD_RAW_DB__SPARCS.name
  privilege = "USAGE"
  roles = [snowflake_role.PROD_RAW_DB_SPARCS_R_AR.name, snowflake_role.PROD_RAW_DB_SPARCS_RW_AR.name, snowflake_role.PROD_RAW_DB_SPARCS_FULL_AR.name]
  enable_multiple_grants = true
  on_all = true
  depends_on = [snowflake_schema_grant.grant_ownership_on_prod_raw_db__sparcs_schema, snowflake_role_ownership_grant.role_prod_raw_db_sparcs_r_ar_ownership_grant, snowflake_sequence_grant.grant_ownership_on_prod_raw_db__sparcs_sequences]
}

resource snowflake_sequence_grant grant_usage_on_future_prod_raw_db__sparcs_sequences {
  database_name = snowflake_database.PROD_RAW_DB.name
  schema_name = snowflake_schema.PROD_RAW_DB__SPARCS.name

  privilege = "USAGE"
  roles = [snowflake_role.PROD_RAW_DB_SPARCS_R_AR.name, snowflake_role.PROD_RAW_DB_SPARCS_RW_AR.name, snowflake_role.PROD_RAW_DB_SPARCS_FULL_AR.name]

  on_future = true
  with_grant_option = false
  enable_multiple_grants = true
  depends_on = [snowflake_schema_grant.grant_ownership_on_prod_raw_db__sparcs_schema, snowflake_role_ownership_grant.role_prod_raw_db_sparcs_r_ar_ownership_grant, snowflake_sequence_grant.grant_ownership_on_prod_raw_db__sparcs_sequences]
}

resource snowflake_sequence_grant grant_ownership_on_prod_raw_db__sparcs_sequences {
  database_name = snowflake_database.PROD_RAW_DB.name
  schema_name = snowflake_schema.PROD_RAW_DB__SPARCS.name
  privilege = "OWNERSHIP"
  roles = [snowflake_role.PROD_RAW_DB_SPARCS_FULL_AR.name]
  enable_multiple_grants = true
  on_all = true
  depends_on = [snowflake_schema_grant.grant_ownership_on_prod_raw_db__sparcs_schema, snowflake_role_ownership_grant.role_prod_raw_db_sparcs_full_ar_ownership_grant]
}

resource snowflake_sequence_grant grant_ownership_on_future_prod_raw_db__sparcs_sequences {
  database_name = snowflake_database.PROD_RAW_DB.name
  schema_name = snowflake_schema.PROD_RAW_DB__SPARCS.name

  privilege = "OWNERSHIP"
  roles = [snowflake_role.PROD_RAW_DB_SPARCS_FULL_AR.name]

  on_future = true
  with_grant_option = false
  enable_multiple_grants = true
  depends_on = [snowflake_schema_grant.grant_ownership_on_prod_raw_db__sparcs_schema, snowflake_role_ownership_grant.role_prod_raw_db_sparcs_full_ar_ownership_grant, snowflake_sequence_grant.grant_ownership_on_prod_raw_db__sparcs_sequences]
}

resource snowflake_sequence_grant grant_usage_on_prod_raw_db__vitals_sequences {
  database_name = snowflake_database.PROD_RAW_DB.name
  schema_name = snowflake_schema.PROD_RAW_DB__VITALS.name
  privilege = "USAGE"
  roles = [snowflake_role.PROD_RAW_DB_VITALS_R_AR.name, snowflake_role.PROD_RAW_DB_VITALS_RW_AR.name, snowflake_role.PROD_RAW_DB_VITALS_FULL_AR.name]
  enable_multiple_grants = true
  on_all = true
  depends_on = [snowflake_schema_grant.grant_ownership_on_prod_raw_db__vitals_schema, snowflake_role_ownership_grant.role_prod_raw_db_vitals_r_ar_ownership_grant, snowflake_sequence_grant.grant_ownership_on_prod_raw_db__vitals_sequences]
}

resource snowflake_sequence_grant grant_usage_on_future_prod_raw_db__vitals_sequences {
  database_name = snowflake_database.PROD_RAW_DB.name
  schema_name = snowflake_schema.PROD_RAW_DB__VITALS.name

  privilege = "USAGE"
  roles = [snowflake_role.PROD_RAW_DB_VITALS_R_AR.name, snowflake_role.PROD_RAW_DB_VITALS_RW_AR.name, snowflake_role.PROD_RAW_DB_VITALS_FULL_AR.name]

  on_future = true
  with_grant_option = false
  enable_multiple_grants = true
  depends_on = [snowflake_schema_grant.grant_ownership_on_prod_raw_db__vitals_schema, snowflake_role_ownership_grant.role_prod_raw_db_vitals_r_ar_ownership_grant, snowflake_sequence_grant.grant_ownership_on_prod_raw_db__vitals_sequences]
}

resource snowflake_sequence_grant grant_ownership_on_prod_raw_db__vitals_sequences {
  database_name = snowflake_database.PROD_RAW_DB.name
  schema_name = snowflake_schema.PROD_RAW_DB__VITALS.name
  privilege = "OWNERSHIP"
  roles = [snowflake_role.PROD_RAW_DB_VITALS_FULL_AR.name]
  enable_multiple_grants = true
  on_all = true
  depends_on = [snowflake_schema_grant.grant_ownership_on_prod_raw_db__vitals_schema, snowflake_role_ownership_grant.role_prod_raw_db_vitals_full_ar_ownership_grant]
}

resource snowflake_sequence_grant grant_ownership_on_future_prod_raw_db__vitals_sequences {
  database_name = snowflake_database.PROD_RAW_DB.name
  schema_name = snowflake_schema.PROD_RAW_DB__VITALS.name

  privilege = "OWNERSHIP"
  roles = [snowflake_role.PROD_RAW_DB_VITALS_FULL_AR.name]

  on_future = true
  with_grant_option = false
  enable_multiple_grants = true
  depends_on = [snowflake_schema_grant.grant_ownership_on_prod_raw_db__vitals_schema, snowflake_role_ownership_grant.role_prod_raw_db_vitals_full_ar_ownership_grant, snowflake_sequence_grant.grant_ownership_on_prod_raw_db__vitals_sequences]
}

resource snowflake_stage_grant grant_usage_on_prod_raw_db__sparcs_stages {
  database_name = snowflake_database.PROD_RAW_DB.name
  schema_name = snowflake_schema.PROD_RAW_DB__SPARCS.name
  privilege = "USAGE"
  roles = [snowflake_role.PROD_RAW_DB_SPARCS_R_AR.name, snowflake_role.PROD_RAW_DB_SPARCS_RW_AR.name, snowflake_role.PROD_RAW_DB_SPARCS_FULL_AR.name]
  enable_multiple_grants = true
  on_all = true
  depends_on = [snowflake_schema_grant.grant_ownership_on_prod_raw_db__sparcs_schema, snowflake_role_ownership_grant.role_prod_raw_db_sparcs_r_ar_ownership_grant, snowflake_stage_grant.grant_ownership_on_prod_raw_db__sparcs_stages]
}

resource snowflake_stage_grant grant_read_on_prod_raw_db__sparcs_stages {
  database_name = snowflake_database.PROD_RAW_DB.name
  schema_name = snowflake_schema.PROD_RAW_DB__SPARCS.name
  privilege = "READ"
  roles = [snowflake_role.PROD_RAW_DB_SPARCS_R_AR.name, snowflake_role.PROD_RAW_DB_SPARCS_RW_AR.name, snowflake_role.PROD_RAW_DB_SPARCS_FULL_AR.name]
  enable_multiple_grants = true
  on_all = true
  depends_on = [snowflake_schema_grant.grant_ownership_on_prod_raw_db__sparcs_schema, snowflake_role_ownership_grant.role_prod_raw_db_sparcs_r_ar_ownership_grant, snowflake_stage_grant.grant_ownership_on_prod_raw_db__sparcs_stages]
}

resource snowflake_stage_grant grant_usage_on_future_prod_raw_db__sparcs_stages {
  database_name = snowflake_database.PROD_RAW_DB.name
  schema_name = snowflake_schema.PROD_RAW_DB__SPARCS.name

  privilege = "USAGE"
  roles = [snowflake_role.PROD_RAW_DB_SPARCS_R_AR.name, snowflake_role.PROD_RAW_DB_SPARCS_RW_AR.name, snowflake_role.PROD_RAW_DB_SPARCS_FULL_AR.name]

  on_future = true
  with_grant_option = false
  enable_multiple_grants = true
  depends_on = [snowflake_schema_grant.grant_ownership_on_prod_raw_db__sparcs_schema, snowflake_role_ownership_grant.role_prod_raw_db_sparcs_r_ar_ownership_grant, snowflake_stage_grant.grant_ownership_on_prod_raw_db__sparcs_stages]
}

resource snowflake_stage_grant grant_read_on_future_prod_raw_db__sparcs_stages {
  database_name = snowflake_database.PROD_RAW_DB.name
  schema_name = snowflake_schema.PROD_RAW_DB__SPARCS.name

  privilege = "READ"
  roles = [snowflake_role.PROD_RAW_DB_SPARCS_R_AR.name, snowflake_role.PROD_RAW_DB_SPARCS_RW_AR.name, snowflake_role.PROD_RAW_DB_SPARCS_FULL_AR.name]

  on_future = true
  with_grant_option = false
  enable_multiple_grants = true
  depends_on = [snowflake_schema_grant.grant_ownership_on_prod_raw_db__sparcs_schema, snowflake_role_ownership_grant.role_prod_raw_db_sparcs_r_ar_ownership_grant, snowflake_stage_grant.grant_ownership_on_prod_raw_db__sparcs_stages]
}

resource snowflake_stage_grant grant_write_on_future_prod_raw_db__sparcs_stages {
  database_name = snowflake_database.PROD_RAW_DB.name
  schema_name = snowflake_schema.PROD_RAW_DB__SPARCS.name

  privilege = "WRITE"
  roles = [snowflake_role.PROD_RAW_DB_SPARCS_RW_AR.name, snowflake_role.PROD_RAW_DB_SPARCS_FULL_AR.name]

  on_future = true
  with_grant_option = false
  enable_multiple_grants = true
  depends_on = [snowflake_stage_grant.grant_usage_on_future_prod_raw_db__sparcs_stages, snowflake_stage_grant.grant_read_on_future_prod_raw_db__sparcs_stages, snowflake_role_ownership_grant.role_prod_raw_db_sparcs_rw_ar_ownership_grant, snowflake_stage_grant.grant_ownership_on_prod_raw_db__sparcs_stages]
}

resource snowflake_stage_grant grant_write_on_prod_raw_db__sparcs_stages {
  database_name = snowflake_database.PROD_RAW_DB.name
  schema_name = snowflake_schema.PROD_RAW_DB__SPARCS.name
  privilege = "WRITE"
  roles = [snowflake_role.PROD_RAW_DB_SPARCS_RW_AR.name, snowflake_role.PROD_RAW_DB_SPARCS_FULL_AR.name]
  enable_multiple_grants = true
  on_all = true
  depends_on = [snowflake_schema_grant.grant_ownership_on_prod_raw_db__sparcs_schema, snowflake_role_ownership_grant.role_prod_raw_db_sparcs_rw_ar_ownership_grant, snowflake_stage_grant.grant_ownership_on_prod_raw_db__sparcs_stages]
}

resource snowflake_stage_grant grant_ownership_on_prod_raw_db__sparcs_stages {
  database_name = snowflake_database.PROD_RAW_DB.name
  schema_name = snowflake_schema.PROD_RAW_DB__SPARCS.name
  privilege = "OWNERSHIP"
  roles = [snowflake_role.PROD_RAW_DB_SPARCS_FULL_AR.name]
  enable_multiple_grants = true
  on_all = true
  depends_on = [snowflake_schema_grant.grant_ownership_on_prod_raw_db__sparcs_schema, snowflake_role_ownership_grant.role_prod_raw_db_sparcs_full_ar_ownership_grant]
}

resource snowflake_stage_grant grant_ownership_on_future_prod_raw_db__sparcs_stages {
  database_name = snowflake_database.PROD_RAW_DB.name
  schema_name = snowflake_schema.PROD_RAW_DB__SPARCS.name

  privilege = "OWNERSHIP"
  roles = [snowflake_role.PROD_RAW_DB_SPARCS_FULL_AR.name]

  on_future = true
  with_grant_option = false
  enable_multiple_grants = true
  depends_on = [snowflake_schema_grant.grant_ownership_on_prod_raw_db__sparcs_schema, snowflake_role_ownership_grant.role_prod_raw_db_sparcs_full_ar_ownership_grant, snowflake_stage_grant.grant_ownership_on_prod_raw_db__sparcs_stages]
}

resource snowflake_stage_grant grant_usage_on_prod_raw_db__vitals_stages {
  database_name = snowflake_database.PROD_RAW_DB.name
  schema_name = snowflake_schema.PROD_RAW_DB__VITALS.name
  privilege = "USAGE"
  roles = [snowflake_role.PROD_RAW_DB_VITALS_R_AR.name, snowflake_role.PROD_RAW_DB_VITALS_RW_AR.name, snowflake_role.PROD_RAW_DB_VITALS_FULL_AR.name]
  enable_multiple_grants = true
  on_all = true
  depends_on = [snowflake_schema_grant.grant_ownership_on_prod_raw_db__vitals_schema, snowflake_role_ownership_grant.role_prod_raw_db_vitals_r_ar_ownership_grant, snowflake_stage_grant.grant_ownership_on_prod_raw_db__vitals_stages]
}

resource snowflake_stage_grant grant_read_on_prod_raw_db__vitals_stages {
  database_name = snowflake_database.PROD_RAW_DB.name
  schema_name = snowflake_schema.PROD_RAW_DB__VITALS.name
  privilege = "READ"
  roles = [snowflake_role.PROD_RAW_DB_VITALS_R_AR.name, snowflake_role.PROD_RAW_DB_VITALS_RW_AR.name, snowflake_role.PROD_RAW_DB_VITALS_FULL_AR.name]
  enable_multiple_grants = true
  on_all = true
  depends_on = [snowflake_schema_grant.grant_ownership_on_prod_raw_db__vitals_schema, snowflake_role_ownership_grant.role_prod_raw_db_vitals_r_ar_ownership_grant, snowflake_stage_grant.grant_ownership_on_prod_raw_db__vitals_stages]
}

resource snowflake_stage_grant grant_usage_on_future_prod_raw_db__vitals_stages {
  database_name = snowflake_database.PROD_RAW_DB.name
  schema_name = snowflake_schema.PROD_RAW_DB__VITALS.name

  privilege = "USAGE"
  roles = [snowflake_role.PROD_RAW_DB_VITALS_R_AR.name, snowflake_role.PROD_RAW_DB_VITALS_RW_AR.name, snowflake_role.PROD_RAW_DB_VITALS_FULL_AR.name]

  on_future = true
  with_grant_option = false
  enable_multiple_grants = true
  depends_on = [snowflake_schema_grant.grant_ownership_on_prod_raw_db__vitals_schema, snowflake_role_ownership_grant.role_prod_raw_db_vitals_r_ar_ownership_grant, snowflake_stage_grant.grant_ownership_on_prod_raw_db__vitals_stages]
}

resource snowflake_stage_grant grant_read_on_future_prod_raw_db__vitals_stages {
  database_name = snowflake_database.PROD_RAW_DB.name
  schema_name = snowflake_schema.PROD_RAW_DB__VITALS.name

  privilege = "READ"
  roles = [snowflake_role.PROD_RAW_DB_VITALS_R_AR.name, snowflake_role.PROD_RAW_DB_VITALS_RW_AR.name, snowflake_role.PROD_RAW_DB_VITALS_FULL_AR.name]

  on_future = true
  with_grant_option = false
  enable_multiple_grants = true
  depends_on = [snowflake_schema_grant.grant_ownership_on_prod_raw_db__vitals_schema, snowflake_role_ownership_grant.role_prod_raw_db_vitals_r_ar_ownership_grant, snowflake_stage_grant.grant_ownership_on_prod_raw_db__vitals_stages]
}

resource snowflake_stage_grant grant_write_on_future_prod_raw_db__vitals_stages {
  database_name = snowflake_database.PROD_RAW_DB.name
  schema_name = snowflake_schema.PROD_RAW_DB__VITALS.name

  privilege = "WRITE"
  roles = [snowflake_role.PROD_RAW_DB_VITALS_RW_AR.name, snowflake_role.PROD_RAW_DB_VITALS_FULL_AR.name]

  on_future = true
  with_grant_option = false
  enable_multiple_grants = true
  depends_on = [snowflake_stage_grant.grant_usage_on_future_prod_raw_db__vitals_stages, snowflake_stage_grant.grant_read_on_future_prod_raw_db__vitals_stages, snowflake_role_ownership_grant.role_prod_raw_db_vitals_rw_ar_ownership_grant, snowflake_stage_grant.grant_ownership_on_prod_raw_db__vitals_stages]
}

resource snowflake_stage_grant grant_write_on_prod_raw_db__vitals_stages {
  database_name = snowflake_database.PROD_RAW_DB.name
  schema_name = snowflake_schema.PROD_RAW_DB__VITALS.name
  privilege = "WRITE"
  roles = [snowflake_role.PROD_RAW_DB_VITALS_RW_AR.name, snowflake_role.PROD_RAW_DB_VITALS_FULL_AR.name]
  enable_multiple_grants = true
  on_all = true
  depends_on = [snowflake_schema_grant.grant_ownership_on_prod_raw_db__vitals_schema, snowflake_role_ownership_grant.role_prod_raw_db_vitals_rw_ar_ownership_grant, snowflake_stage_grant.grant_ownership_on_prod_raw_db__vitals_stages]
}

resource snowflake_stage_grant grant_ownership_on_prod_raw_db__vitals_stages {
  database_name = snowflake_database.PROD_RAW_DB.name
  schema_name = snowflake_schema.PROD_RAW_DB__VITALS.name
  privilege = "OWNERSHIP"
  roles = [snowflake_role.PROD_RAW_DB_VITALS_FULL_AR.name]
  enable_multiple_grants = true
  on_all = true
  depends_on = [snowflake_schema_grant.grant_ownership_on_prod_raw_db__vitals_schema, snowflake_role_ownership_grant.role_prod_raw_db_vitals_full_ar_ownership_grant]
}

resource snowflake_stage_grant grant_ownership_on_future_prod_raw_db__vitals_stages {
  database_name = snowflake_database.PROD_RAW_DB.name
  schema_name = snowflake_schema.PROD_RAW_DB__VITALS.name

  privilege = "OWNERSHIP"
  roles = [snowflake_role.PROD_RAW_DB_VITALS_FULL_AR.name]

  on_future = true
  with_grant_option = false
  enable_multiple_grants = true
  depends_on = [snowflake_schema_grant.grant_ownership_on_prod_raw_db__vitals_schema, snowflake_role_ownership_grant.role_prod_raw_db_vitals_full_ar_ownership_grant, snowflake_stage_grant.grant_ownership_on_prod_raw_db__vitals_stages]
}

resource snowflake_file_format_grant grant_usage_on_prod_raw_db__sparcs_file_formats {
  database_name = snowflake_database.PROD_RAW_DB.name
  schema_name = snowflake_schema.PROD_RAW_DB__SPARCS.name
  privilege = "USAGE"
  roles = [snowflake_role.PROD_RAW_DB_SPARCS_R_AR.name, snowflake_role.PROD_RAW_DB_SPARCS_RW_AR.name, snowflake_role.PROD_RAW_DB_SPARCS_FULL_AR.name]
  enable_multiple_grants = true
  on_all = true
  depends_on = [snowflake_schema_grant.grant_ownership_on_prod_raw_db__sparcs_schema, snowflake_role_ownership_grant.role_prod_raw_db_sparcs_r_ar_ownership_grant, snowflake_file_format_grant.grant_ownership_on_prod_raw_db__sparcs_file_formats]
}

resource snowflake_file_format_grant grant_usage_on_future_prod_raw_db__sparcs_file_formats {
  database_name = snowflake_database.PROD_RAW_DB.name
  schema_name = snowflake_schema.PROD_RAW_DB__SPARCS.name

  privilege = "USAGE"
  roles = [snowflake_role.PROD_RAW_DB_SPARCS_R_AR.name, snowflake_role.PROD_RAW_DB_SPARCS_RW_AR.name, snowflake_role.PROD_RAW_DB_SPARCS_FULL_AR.name]

  on_future = true
  with_grant_option = false
  enable_multiple_grants = true
  depends_on = [snowflake_schema_grant.grant_ownership_on_prod_raw_db__sparcs_schema, snowflake_role_ownership_grant.role_prod_raw_db_sparcs_r_ar_ownership_grant, snowflake_file_format_grant.grant_ownership_on_prod_raw_db__sparcs_file_formats]
}

resource snowflake_file_format_grant grant_ownership_on_prod_raw_db__sparcs_file_formats {
  database_name = snowflake_database.PROD_RAW_DB.name
  schema_name = snowflake_schema.PROD_RAW_DB__SPARCS.name
  privilege = "OWNERSHIP"
  roles = [snowflake_role.PROD_RAW_DB_SPARCS_FULL_AR.name]
  enable_multiple_grants = true
  on_all = true
  depends_on = [snowflake_schema_grant.grant_ownership_on_prod_raw_db__sparcs_schema, snowflake_role_ownership_grant.role_prod_raw_db_sparcs_full_ar_ownership_grant]
}

resource snowflake_file_format_grant grant_ownership_on_future_prod_raw_db__sparcs_file_formats {
  database_name = snowflake_database.PROD_RAW_DB.name
  schema_name = snowflake_schema.PROD_RAW_DB__SPARCS.name

  privilege = "OWNERSHIP"
  roles = [snowflake_role.PROD_RAW_DB_SPARCS_FULL_AR.name]

  on_future = true
  with_grant_option = false
  enable_multiple_grants = true
  depends_on = [snowflake_schema_grant.grant_ownership_on_prod_raw_db__sparcs_schema, snowflake_role_ownership_grant.role_prod_raw_db_sparcs_full_ar_ownership_grant, snowflake_file_format_grant.grant_ownership_on_prod_raw_db__sparcs_file_formats]
}

resource snowflake_file_format_grant grant_usage_on_prod_raw_db__vitals_file_formats {
  database_name = snowflake_database.PROD_RAW_DB.name
  schema_name = snowflake_schema.PROD_RAW_DB__VITALS.name
  privilege = "USAGE"
  roles = [snowflake_role.PROD_RAW_DB_VITALS_R_AR.name, snowflake_role.PROD_RAW_DB_VITALS_RW_AR.name, snowflake_role.PROD_RAW_DB_VITALS_FULL_AR.name]
  enable_multiple_grants = true
  on_all = true
  depends_on = [snowflake_schema_grant.grant_ownership_on_prod_raw_db__vitals_schema, snowflake_role_ownership_grant.role_prod_raw_db_vitals_r_ar_ownership_grant, snowflake_file_format_grant.grant_ownership_on_prod_raw_db__vitals_file_formats]
}

resource snowflake_file_format_grant grant_usage_on_future_prod_raw_db__vitals_file_formats {
  database_name = snowflake_database.PROD_RAW_DB.name
  schema_name = snowflake_schema.PROD_RAW_DB__VITALS.name

  privilege = "USAGE"
  roles = [snowflake_role.PROD_RAW_DB_VITALS_R_AR.name, snowflake_role.PROD_RAW_DB_VITALS_RW_AR.name, snowflake_role.PROD_RAW_DB_VITALS_FULL_AR.name]

  on_future = true
  with_grant_option = false
  enable_multiple_grants = true
  depends_on = [snowflake_schema_grant.grant_ownership_on_prod_raw_db__vitals_schema, snowflake_role_ownership_grant.role_prod_raw_db_vitals_r_ar_ownership_grant, snowflake_file_format_grant.grant_ownership_on_prod_raw_db__vitals_file_formats]
}

resource snowflake_file_format_grant grant_ownership_on_prod_raw_db__vitals_file_formats {
  database_name = snowflake_database.PROD_RAW_DB.name
  schema_name = snowflake_schema.PROD_RAW_DB__VITALS.name
  privilege = "OWNERSHIP"
  roles = [snowflake_role.PROD_RAW_DB_VITALS_FULL_AR.name]
  enable_multiple_grants = true
  on_all = true
  depends_on = [snowflake_schema_grant.grant_ownership_on_prod_raw_db__vitals_schema, snowflake_role_ownership_grant.role_prod_raw_db_vitals_full_ar_ownership_grant]
}

resource snowflake_file_format_grant grant_ownership_on_future_prod_raw_db__vitals_file_formats {
  database_name = snowflake_database.PROD_RAW_DB.name
  schema_name = snowflake_schema.PROD_RAW_DB__VITALS.name

  privilege = "OWNERSHIP"
  roles = [snowflake_role.PROD_RAW_DB_VITALS_FULL_AR.name]

  on_future = true
  with_grant_option = false
  enable_multiple_grants = true
  depends_on = [snowflake_schema_grant.grant_ownership_on_prod_raw_db__vitals_schema, snowflake_role_ownership_grant.role_prod_raw_db_vitals_full_ar_ownership_grant, snowflake_file_format_grant.grant_ownership_on_prod_raw_db__vitals_file_formats]
}

resource snowflake_stream_grant grant_select_on_prod_raw_db__sparcs_streams {
  database_name = snowflake_database.PROD_RAW_DB.name
  schema_name = snowflake_schema.PROD_RAW_DB__SPARCS.name
  privilege = "SELECT"
  roles = [snowflake_role.PROD_RAW_DB_SPARCS_R_AR.name, snowflake_role.PROD_RAW_DB_SPARCS_RW_AR.name, snowflake_role.PROD_RAW_DB_SPARCS_FULL_AR.name]
  enable_multiple_grants = true
  on_all = true
  depends_on = [snowflake_schema_grant.grant_ownership_on_prod_raw_db__sparcs_schema, snowflake_role_ownership_grant.role_prod_raw_db_sparcs_r_ar_ownership_grant, snowflake_stream_grant.grant_ownership_on_prod_raw_db__sparcs_streams]
}

resource snowflake_stream_grant grant_select_on_future_prod_raw_db__sparcs_streams {
  database_name = snowflake_database.PROD_RAW_DB.name
  schema_name = snowflake_schema.PROD_RAW_DB__SPARCS.name

  privilege = "SELECT"
  roles = [snowflake_role.PROD_RAW_DB_SPARCS_R_AR.name, snowflake_role.PROD_RAW_DB_SPARCS_RW_AR.name, snowflake_role.PROD_RAW_DB_SPARCS_FULL_AR.name]

  on_future = true
  with_grant_option = false
  enable_multiple_grants = true
  depends_on = [snowflake_schema_grant.grant_ownership_on_prod_raw_db__sparcs_schema, snowflake_role_ownership_grant.role_prod_raw_db_sparcs_r_ar_ownership_grant, snowflake_stream_grant.grant_ownership_on_prod_raw_db__sparcs_streams]
}

resource snowflake_stream_grant grant_ownership_on_prod_raw_db__sparcs_streams {
  database_name = snowflake_database.PROD_RAW_DB.name
  schema_name = snowflake_schema.PROD_RAW_DB__SPARCS.name
  privilege = "OWNERSHIP"
  roles = [snowflake_role.PROD_RAW_DB_SPARCS_FULL_AR.name]
  enable_multiple_grants = true
  on_all = true
  depends_on = [snowflake_schema_grant.grant_ownership_on_prod_raw_db__sparcs_schema, snowflake_role_ownership_grant.role_prod_raw_db_sparcs_full_ar_ownership_grant]
}

resource snowflake_stream_grant grant_ownership_on_future_prod_raw_db__sparcs_streams {
  database_name = snowflake_database.PROD_RAW_DB.name
  schema_name = snowflake_schema.PROD_RAW_DB__SPARCS.name

  privilege = "OWNERSHIP"
  roles = [snowflake_role.PROD_RAW_DB_SPARCS_FULL_AR.name]

  on_future = true
  with_grant_option = false
  enable_multiple_grants = true
  depends_on = [snowflake_schema_grant.grant_ownership_on_prod_raw_db__sparcs_schema, snowflake_role_ownership_grant.role_prod_raw_db_sparcs_full_ar_ownership_grant, snowflake_stream_grant.grant_ownership_on_prod_raw_db__sparcs_streams]
}

resource snowflake_stream_grant grant_select_on_prod_raw_db__vitals_streams {
  database_name = snowflake_database.PROD_RAW_DB.name
  schema_name = snowflake_schema.PROD_RAW_DB__VITALS.name
  privilege = "SELECT"
  roles = [snowflake_role.PROD_RAW_DB_VITALS_R_AR.name, snowflake_role.PROD_RAW_DB_VITALS_RW_AR.name, snowflake_role.PROD_RAW_DB_VITALS_FULL_AR.name]
  enable_multiple_grants = true
  on_all = true
  depends_on = [snowflake_schema_grant.grant_ownership_on_prod_raw_db__vitals_schema, snowflake_role_ownership_grant.role_prod_raw_db_vitals_r_ar_ownership_grant, snowflake_stream_grant.grant_ownership_on_prod_raw_db__vitals_streams]
}

resource snowflake_stream_grant grant_select_on_future_prod_raw_db__vitals_streams {
  database_name = snowflake_database.PROD_RAW_DB.name
  schema_name = snowflake_schema.PROD_RAW_DB__VITALS.name

  privilege = "SELECT"
  roles = [snowflake_role.PROD_RAW_DB_VITALS_R_AR.name, snowflake_role.PROD_RAW_DB_VITALS_RW_AR.name, snowflake_role.PROD_RAW_DB_VITALS_FULL_AR.name]

  on_future = true
  with_grant_option = false
  enable_multiple_grants = true
  depends_on = [snowflake_schema_grant.grant_ownership_on_prod_raw_db__vitals_schema, snowflake_role_ownership_grant.role_prod_raw_db_vitals_r_ar_ownership_grant, snowflake_stream_grant.grant_ownership_on_prod_raw_db__vitals_streams]
}

resource snowflake_stream_grant grant_ownership_on_prod_raw_db__vitals_streams {
  database_name = snowflake_database.PROD_RAW_DB.name
  schema_name = snowflake_schema.PROD_RAW_DB__VITALS.name
  privilege = "OWNERSHIP"
  roles = [snowflake_role.PROD_RAW_DB_VITALS_FULL_AR.name]
  enable_multiple_grants = true
  on_all = true
  depends_on = [snowflake_schema_grant.grant_ownership_on_prod_raw_db__vitals_schema, snowflake_role_ownership_grant.role_prod_raw_db_vitals_full_ar_ownership_grant]
}

resource snowflake_stream_grant grant_ownership_on_future_prod_raw_db__vitals_streams {
  database_name = snowflake_database.PROD_RAW_DB.name
  schema_name = snowflake_schema.PROD_RAW_DB__VITALS.name

  privilege = "OWNERSHIP"
  roles = [snowflake_role.PROD_RAW_DB_VITALS_FULL_AR.name]

  on_future = true
  with_grant_option = false
  enable_multiple_grants = true
  depends_on = [snowflake_schema_grant.grant_ownership_on_prod_raw_db__vitals_schema, snowflake_role_ownership_grant.role_prod_raw_db_vitals_full_ar_ownership_grant, snowflake_stream_grant.grant_ownership_on_prod_raw_db__vitals_streams]
}

resource snowflake_procedure_grant grant_usage_on_prod_raw_db__sparcs_procedures {
  database_name = snowflake_database.PROD_RAW_DB.name
  schema_name = snowflake_schema.PROD_RAW_DB__SPARCS.name
  privilege = "USAGE"
  roles = [snowflake_role.PROD_RAW_DB_SPARCS_R_AR.name, snowflake_role.PROD_RAW_DB_SPARCS_RW_AR.name, snowflake_role.PROD_RAW_DB_SPARCS_FULL_AR.name]
  enable_multiple_grants = true
  on_all = true
  depends_on = [snowflake_schema_grant.grant_ownership_on_prod_raw_db__sparcs_schema, snowflake_role_ownership_grant.role_prod_raw_db_sparcs_r_ar_ownership_grant, snowflake_procedure_grant.grant_ownership_on_prod_raw_db__sparcs_procedures]
}

resource snowflake_procedure_grant grant_usage_on_future_prod_raw_db__sparcs_procedures {
  database_name = snowflake_database.PROD_RAW_DB.name
  schema_name = snowflake_schema.PROD_RAW_DB__SPARCS.name

  privilege = "USAGE"
  roles = [snowflake_role.PROD_RAW_DB_SPARCS_R_AR.name, snowflake_role.PROD_RAW_DB_SPARCS_RW_AR.name, snowflake_role.PROD_RAW_DB_SPARCS_FULL_AR.name]

  on_future = true
  with_grant_option = false
  enable_multiple_grants = true
  depends_on = [snowflake_schema_grant.grant_ownership_on_prod_raw_db__sparcs_schema, snowflake_role_ownership_grant.role_prod_raw_db_sparcs_r_ar_ownership_grant, snowflake_procedure_grant.grant_ownership_on_prod_raw_db__sparcs_procedures]
}

resource snowflake_procedure_grant grant_ownership_on_prod_raw_db__sparcs_procedures {
  database_name = snowflake_database.PROD_RAW_DB.name
  schema_name = snowflake_schema.PROD_RAW_DB__SPARCS.name
  privilege = "OWNERSHIP"
  roles = [snowflake_role.PROD_RAW_DB_SPARCS_FULL_AR.name]
  enable_multiple_grants = true
  on_all = true
  depends_on = [snowflake_schema_grant.grant_ownership_on_prod_raw_db__sparcs_schema, snowflake_role_ownership_grant.role_prod_raw_db_sparcs_full_ar_ownership_grant]
}

resource snowflake_procedure_grant grant_ownership_on_future_prod_raw_db__sparcs_procedures {
  database_name = snowflake_database.PROD_RAW_DB.name
  schema_name = snowflake_schema.PROD_RAW_DB__SPARCS.name

  privilege = "OWNERSHIP"
  roles = [snowflake_role.PROD_RAW_DB_SPARCS_FULL_AR.name]

  on_future = true
  with_grant_option = false
  enable_multiple_grants = true
  depends_on = [snowflake_schema_grant.grant_ownership_on_prod_raw_db__sparcs_schema, snowflake_role_ownership_grant.role_prod_raw_db_sparcs_full_ar_ownership_grant, snowflake_procedure_grant.grant_ownership_on_prod_raw_db__sparcs_procedures]
}

resource snowflake_procedure_grant grant_usage_on_prod_raw_db__vitals_procedures {
  database_name = snowflake_database.PROD_RAW_DB.name
  schema_name = snowflake_schema.PROD_RAW_DB__VITALS.name
  privilege = "USAGE"
  roles = [snowflake_role.PROD_RAW_DB_VITALS_R_AR.name, snowflake_role.PROD_RAW_DB_VITALS_RW_AR.name, snowflake_role.PROD_RAW_DB_VITALS_FULL_AR.name]
  enable_multiple_grants = true
  on_all = true
  depends_on = [snowflake_schema_grant.grant_ownership_on_prod_raw_db__vitals_schema, snowflake_role_ownership_grant.role_prod_raw_db_vitals_r_ar_ownership_grant, snowflake_procedure_grant.grant_ownership_on_prod_raw_db__vitals_procedures]
}

resource snowflake_procedure_grant grant_usage_on_future_prod_raw_db__vitals_procedures {
  database_name = snowflake_database.PROD_RAW_DB.name
  schema_name = snowflake_schema.PROD_RAW_DB__VITALS.name

  privilege = "USAGE"
  roles = [snowflake_role.PROD_RAW_DB_VITALS_R_AR.name, snowflake_role.PROD_RAW_DB_VITALS_RW_AR.name, snowflake_role.PROD_RAW_DB_VITALS_FULL_AR.name]

  on_future = true
  with_grant_option = false
  enable_multiple_grants = true
  depends_on = [snowflake_schema_grant.grant_ownership_on_prod_raw_db__vitals_schema, snowflake_role_ownership_grant.role_prod_raw_db_vitals_r_ar_ownership_grant, snowflake_procedure_grant.grant_ownership_on_prod_raw_db__vitals_procedures]
}

resource snowflake_procedure_grant grant_ownership_on_prod_raw_db__vitals_procedures {
  database_name = snowflake_database.PROD_RAW_DB.name
  schema_name = snowflake_schema.PROD_RAW_DB__VITALS.name
  privilege = "OWNERSHIP"
  roles = [snowflake_role.PROD_RAW_DB_VITALS_FULL_AR.name]
  enable_multiple_grants = true
  on_all = true
  depends_on = [snowflake_schema_grant.grant_ownership_on_prod_raw_db__vitals_schema, snowflake_role_ownership_grant.role_prod_raw_db_vitals_full_ar_ownership_grant]
}

resource snowflake_procedure_grant grant_ownership_on_future_prod_raw_db__vitals_procedures {
  database_name = snowflake_database.PROD_RAW_DB.name
  schema_name = snowflake_schema.PROD_RAW_DB__VITALS.name

  privilege = "OWNERSHIP"
  roles = [snowflake_role.PROD_RAW_DB_VITALS_FULL_AR.name]

  on_future = true
  with_grant_option = false
  enable_multiple_grants = true
  depends_on = [snowflake_schema_grant.grant_ownership_on_prod_raw_db__vitals_schema, snowflake_role_ownership_grant.role_prod_raw_db_vitals_full_ar_ownership_grant, snowflake_procedure_grant.grant_ownership_on_prod_raw_db__vitals_procedures]
}

resource snowflake_function_grant grant_usage_on_prod_raw_db__sparcs_functions {
  database_name = snowflake_database.PROD_RAW_DB.name
  schema_name = snowflake_schema.PROD_RAW_DB__SPARCS.name
  privilege = "USAGE"
  roles = [snowflake_role.PROD_RAW_DB_SPARCS_R_AR.name, snowflake_role.PROD_RAW_DB_SPARCS_RW_AR.name, snowflake_role.PROD_RAW_DB_SPARCS_FULL_AR.name]
  enable_multiple_grants = true
  on_all = true
  depends_on = [snowflake_schema_grant.grant_ownership_on_prod_raw_db__sparcs_schema, snowflake_role_ownership_grant.role_prod_raw_db_sparcs_r_ar_ownership_grant, snowflake_function_grant.grant_ownership_on_prod_raw_db__sparcs_functions]
}

resource snowflake_function_grant grant_usage_on_future_prod_raw_db__sparcs_functions {
  database_name = snowflake_database.PROD_RAW_DB.name
  schema_name = snowflake_schema.PROD_RAW_DB__SPARCS.name

  privilege = "USAGE"
  roles = [snowflake_role.PROD_RAW_DB_SPARCS_R_AR.name, snowflake_role.PROD_RAW_DB_SPARCS_RW_AR.name, snowflake_role.PROD_RAW_DB_SPARCS_FULL_AR.name]

  on_future = true
  with_grant_option = false
  enable_multiple_grants = true
  depends_on = [snowflake_schema_grant.grant_ownership_on_prod_raw_db__sparcs_schema, snowflake_role_ownership_grant.role_prod_raw_db_sparcs_r_ar_ownership_grant, snowflake_function_grant.grant_ownership_on_prod_raw_db__sparcs_functions]
}

resource snowflake_function_grant grant_ownership_on_prod_raw_db__sparcs_functions {
  database_name = snowflake_database.PROD_RAW_DB.name
  schema_name = snowflake_schema.PROD_RAW_DB__SPARCS.name
  privilege = "OWNERSHIP"
  roles = [snowflake_role.PROD_RAW_DB_SPARCS_FULL_AR.name]
  enable_multiple_grants = true
  on_all = true
  depends_on = [snowflake_schema_grant.grant_ownership_on_prod_raw_db__sparcs_schema, snowflake_role_ownership_grant.role_prod_raw_db_sparcs_full_ar_ownership_grant]
}

resource snowflake_function_grant grant_ownership_on_future_prod_raw_db__sparcs_functions {
  database_name = snowflake_database.PROD_RAW_DB.name
  schema_name = snowflake_schema.PROD_RAW_DB__SPARCS.name

  privilege = "OWNERSHIP"
  roles = [snowflake_role.PROD_RAW_DB_SPARCS_FULL_AR.name]

  on_future = true
  with_grant_option = false
  enable_multiple_grants = true
  depends_on = [snowflake_schema_grant.grant_ownership_on_prod_raw_db__sparcs_schema, snowflake_role_ownership_grant.role_prod_raw_db_sparcs_full_ar_ownership_grant, snowflake_function_grant.grant_ownership_on_prod_raw_db__sparcs_functions]
}

resource snowflake_function_grant grant_usage_on_prod_raw_db__vitals_functions {
  database_name = snowflake_database.PROD_RAW_DB.name
  schema_name = snowflake_schema.PROD_RAW_DB__VITALS.name
  privilege = "USAGE"
  roles = [snowflake_role.PROD_RAW_DB_VITALS_R_AR.name, snowflake_role.PROD_RAW_DB_VITALS_RW_AR.name, snowflake_role.PROD_RAW_DB_VITALS_FULL_AR.name]
  enable_multiple_grants = true
  on_all = true
  depends_on = [snowflake_schema_grant.grant_ownership_on_prod_raw_db__vitals_schema, snowflake_role_ownership_grant.role_prod_raw_db_vitals_r_ar_ownership_grant, snowflake_function_grant.grant_ownership_on_prod_raw_db__vitals_functions]
}

resource snowflake_function_grant grant_usage_on_future_prod_raw_db__vitals_functions {
  database_name = snowflake_database.PROD_RAW_DB.name
  schema_name = snowflake_schema.PROD_RAW_DB__VITALS.name

  privilege = "USAGE"
  roles = [snowflake_role.PROD_RAW_DB_VITALS_R_AR.name, snowflake_role.PROD_RAW_DB_VITALS_RW_AR.name, snowflake_role.PROD_RAW_DB_VITALS_FULL_AR.name]

  on_future = true
  with_grant_option = false
  enable_multiple_grants = true
  depends_on = [snowflake_schema_grant.grant_ownership_on_prod_raw_db__vitals_schema, snowflake_role_ownership_grant.role_prod_raw_db_vitals_r_ar_ownership_grant, snowflake_function_grant.grant_ownership_on_prod_raw_db__vitals_functions]
}

resource snowflake_function_grant grant_ownership_on_prod_raw_db__vitals_functions {
  database_name = snowflake_database.PROD_RAW_DB.name
  schema_name = snowflake_schema.PROD_RAW_DB__VITALS.name
  privilege = "OWNERSHIP"
  roles = [snowflake_role.PROD_RAW_DB_VITALS_FULL_AR.name]
  enable_multiple_grants = true
  on_all = true
  depends_on = [snowflake_schema_grant.grant_ownership_on_prod_raw_db__vitals_schema, snowflake_role_ownership_grant.role_prod_raw_db_vitals_full_ar_ownership_grant]
}

resource snowflake_function_grant grant_ownership_on_future_prod_raw_db__vitals_functions {
  database_name = snowflake_database.PROD_RAW_DB.name
  schema_name = snowflake_schema.PROD_RAW_DB__VITALS.name

  privilege = "OWNERSHIP"
  roles = [snowflake_role.PROD_RAW_DB_VITALS_FULL_AR.name]

  on_future = true
  with_grant_option = false
  enable_multiple_grants = true
  depends_on = [snowflake_schema_grant.grant_ownership_on_prod_raw_db__vitals_schema, snowflake_role_ownership_grant.role_prod_raw_db_vitals_full_ar_ownership_grant, snowflake_function_grant.grant_ownership_on_prod_raw_db__vitals_functions]
}

resource snowflake_materialized_view_grant grant_select_on_prod_raw_db__sparcs_materialized_views {
  database_name = snowflake_database.PROD_RAW_DB.name
  schema_name = snowflake_schema.PROD_RAW_DB__SPARCS.name
  privilege = "SELECT"
  roles = [snowflake_role.PROD_RAW_DB_SPARCS_R_AR.name, snowflake_role.PROD_RAW_DB_SPARCS_RW_AR.name, snowflake_role.PROD_RAW_DB_SPARCS_FULL_AR.name]
  enable_multiple_grants = true
  on_all = true
  depends_on = [snowflake_schema_grant.grant_ownership_on_prod_raw_db__sparcs_schema, snowflake_role_ownership_grant.role_prod_raw_db_sparcs_r_ar_ownership_grant, snowflake_materialized_view_grant.grant_ownership_on_prod_raw_db__sparcs_materialized_views]
}

resource snowflake_materialized_view_grant grant_select_on_future_prod_raw_db__sparcs_materialized_views {
  database_name = snowflake_database.PROD_RAW_DB.name
  schema_name = snowflake_schema.PROD_RAW_DB__SPARCS.name

  privilege = "SELECT"
  roles = [snowflake_role.PROD_RAW_DB_SPARCS_R_AR.name, snowflake_role.PROD_RAW_DB_SPARCS_RW_AR.name, snowflake_role.PROD_RAW_DB_SPARCS_FULL_AR.name]

  on_future = true
  with_grant_option = false
  enable_multiple_grants = true
  depends_on = [snowflake_schema_grant.grant_ownership_on_prod_raw_db__sparcs_schema, snowflake_role_ownership_grant.role_prod_raw_db_sparcs_r_ar_ownership_grant, snowflake_materialized_view_grant.grant_ownership_on_prod_raw_db__sparcs_materialized_views]
}

resource snowflake_materialized_view_grant grant_ownership_on_prod_raw_db__sparcs_materialized_views {
  database_name = snowflake_database.PROD_RAW_DB.name
  schema_name = snowflake_schema.PROD_RAW_DB__SPARCS.name
  privilege = "OWNERSHIP"
  roles = [snowflake_role.PROD_RAW_DB_SPARCS_FULL_AR.name]
  enable_multiple_grants = true
  on_all = true
  depends_on = [snowflake_schema_grant.grant_ownership_on_prod_raw_db__sparcs_schema, snowflake_role_ownership_grant.role_prod_raw_db_sparcs_full_ar_ownership_grant]
}

resource snowflake_materialized_view_grant grant_ownership_on_future_prod_raw_db__sparcs_materialized_views {
  database_name = snowflake_database.PROD_RAW_DB.name
  schema_name = snowflake_schema.PROD_RAW_DB__SPARCS.name

  privilege = "OWNERSHIP"
  roles = [snowflake_role.PROD_RAW_DB_SPARCS_FULL_AR.name]

  on_future = true
  with_grant_option = false
  enable_multiple_grants = true
  depends_on = [snowflake_schema_grant.grant_ownership_on_prod_raw_db__sparcs_schema, snowflake_role_ownership_grant.role_prod_raw_db_sparcs_full_ar_ownership_grant, snowflake_materialized_view_grant.grant_ownership_on_prod_raw_db__sparcs_materialized_views]
}

resource snowflake_materialized_view_grant grant_select_on_prod_raw_db__vitals_materialized_views {
  database_name = snowflake_database.PROD_RAW_DB.name
  schema_name = snowflake_schema.PROD_RAW_DB__VITALS.name
  privilege = "SELECT"
  roles = [snowflake_role.PROD_RAW_DB_VITALS_R_AR.name, snowflake_role.PROD_RAW_DB_VITALS_RW_AR.name, snowflake_role.PROD_RAW_DB_VITALS_FULL_AR.name]
  enable_multiple_grants = true
  on_all = true
  depends_on = [snowflake_schema_grant.grant_ownership_on_prod_raw_db__vitals_schema, snowflake_role_ownership_grant.role_prod_raw_db_vitals_r_ar_ownership_grant, snowflake_materialized_view_grant.grant_ownership_on_prod_raw_db__vitals_materialized_views]
}

resource snowflake_materialized_view_grant grant_select_on_future_prod_raw_db__vitals_materialized_views {
  database_name = snowflake_database.PROD_RAW_DB.name
  schema_name = snowflake_schema.PROD_RAW_DB__VITALS.name

  privilege = "SELECT"
  roles = [snowflake_role.PROD_RAW_DB_VITALS_R_AR.name, snowflake_role.PROD_RAW_DB_VITALS_RW_AR.name, snowflake_role.PROD_RAW_DB_VITALS_FULL_AR.name]

  on_future = true
  with_grant_option = false
  enable_multiple_grants = true
  depends_on = [snowflake_schema_grant.grant_ownership_on_prod_raw_db__vitals_schema, snowflake_role_ownership_grant.role_prod_raw_db_vitals_r_ar_ownership_grant, snowflake_materialized_view_grant.grant_ownership_on_prod_raw_db__vitals_materialized_views]
}

resource snowflake_materialized_view_grant grant_ownership_on_prod_raw_db__vitals_materialized_views {
  database_name = snowflake_database.PROD_RAW_DB.name
  schema_name = snowflake_schema.PROD_RAW_DB__VITALS.name
  privilege = "OWNERSHIP"
  roles = [snowflake_role.PROD_RAW_DB_VITALS_FULL_AR.name]
  enable_multiple_grants = true
  on_all = true
  depends_on = [snowflake_schema_grant.grant_ownership_on_prod_raw_db__vitals_schema, snowflake_role_ownership_grant.role_prod_raw_db_vitals_full_ar_ownership_grant]
}

resource snowflake_materialized_view_grant grant_ownership_on_future_prod_raw_db__vitals_materialized_views {
  database_name = snowflake_database.PROD_RAW_DB.name
  schema_name = snowflake_schema.PROD_RAW_DB__VITALS.name

  privilege = "OWNERSHIP"
  roles = [snowflake_role.PROD_RAW_DB_VITALS_FULL_AR.name]

  on_future = true
  with_grant_option = false
  enable_multiple_grants = true
  depends_on = [snowflake_schema_grant.grant_ownership_on_prod_raw_db__vitals_schema, snowflake_role_ownership_grant.role_prod_raw_db_vitals_full_ar_ownership_grant, snowflake_materialized_view_grant.grant_ownership_on_prod_raw_db__vitals_materialized_views]
}

resource snowflake_task_grant grant_monitor_on_prod_raw_db__sparcs_tasks {
  database_name = snowflake_database.PROD_RAW_DB.name
  schema_name = snowflake_schema.PROD_RAW_DB__SPARCS.name
  privilege = "MONITOR"
  roles = [snowflake_role.PROD_RAW_DB_SPARCS_RW_AR.name, snowflake_role.PROD_RAW_DB_SPARCS_FULL_AR.name]
  enable_multiple_grants = true
  on_all = true
  depends_on = [snowflake_schema_grant.grant_ownership_on_prod_raw_db__sparcs_schema, snowflake_role_ownership_grant.role_prod_raw_db_sparcs_rw_ar_ownership_grant, snowflake_task_grant.grant_ownership_on_prod_raw_db__sparcs_tasks]
}

resource snowflake_task_grant grant_operate_on_prod_raw_db__sparcs_tasks {
  database_name = snowflake_database.PROD_RAW_DB.name
  schema_name = snowflake_schema.PROD_RAW_DB__SPARCS.name
  privilege = "OPERATE"
  roles = [snowflake_role.PROD_RAW_DB_SPARCS_RW_AR.name, snowflake_role.PROD_RAW_DB_SPARCS_FULL_AR.name]
  enable_multiple_grants = true
  on_all = true
  depends_on = [snowflake_schema_grant.grant_ownership_on_prod_raw_db__sparcs_schema, snowflake_role_ownership_grant.role_prod_raw_db_sparcs_rw_ar_ownership_grant, snowflake_task_grant.grant_ownership_on_prod_raw_db__sparcs_tasks]
}

resource snowflake_task_grant grant_monitor_on_future_prod_raw_db__sparcs_tasks {
  database_name = snowflake_database.PROD_RAW_DB.name
  schema_name = snowflake_schema.PROD_RAW_DB__SPARCS.name

  privilege = "MONITOR"
  roles = [snowflake_role.PROD_RAW_DB_SPARCS_RW_AR.name, snowflake_role.PROD_RAW_DB_SPARCS_FULL_AR.name]

  on_future = true
  with_grant_option = false
  enable_multiple_grants = true
  depends_on = [snowflake_schema_grant.grant_ownership_on_prod_raw_db__sparcs_schema, snowflake_role_ownership_grant.role_prod_raw_db_sparcs_rw_ar_ownership_grant, snowflake_task_grant.grant_ownership_on_prod_raw_db__sparcs_tasks]
}

resource snowflake_task_grant grant_operate_on_future_prod_raw_db__sparcs_tasks {
  database_name = snowflake_database.PROD_RAW_DB.name
  schema_name = snowflake_schema.PROD_RAW_DB__SPARCS.name

  privilege = "OPERATE"
  roles = [snowflake_role.PROD_RAW_DB_SPARCS_RW_AR.name, snowflake_role.PROD_RAW_DB_SPARCS_FULL_AR.name]

  on_future = true
  with_grant_option = false
  enable_multiple_grants = true
  depends_on = [snowflake_schema_grant.grant_ownership_on_prod_raw_db__sparcs_schema, snowflake_role_ownership_grant.role_prod_raw_db_sparcs_rw_ar_ownership_grant, snowflake_task_grant.grant_ownership_on_prod_raw_db__sparcs_tasks]
}

resource snowflake_task_grant grant_ownership_on_prod_raw_db__sparcs_tasks {
  database_name = snowflake_database.PROD_RAW_DB.name
  schema_name = snowflake_schema.PROD_RAW_DB__SPARCS.name
  privilege = "OWNERSHIP"
  roles = [snowflake_role.PROD_RAW_DB_SPARCS_FULL_AR.name]
  enable_multiple_grants = true
  on_all = true
  depends_on = [snowflake_schema_grant.grant_ownership_on_prod_raw_db__sparcs_schema, snowflake_role_ownership_grant.role_prod_raw_db_sparcs_full_ar_ownership_grant]
}

resource snowflake_task_grant grant_ownership_on_future_prod_raw_db__sparcs_tasks {
  database_name = snowflake_database.PROD_RAW_DB.name
  schema_name = snowflake_schema.PROD_RAW_DB__SPARCS.name

  privilege = "OWNERSHIP"
  roles = [snowflake_role.PROD_RAW_DB_SPARCS_FULL_AR.name]

  on_future = true
  with_grant_option = false
  enable_multiple_grants = true
  depends_on = [snowflake_schema_grant.grant_ownership_on_prod_raw_db__sparcs_schema, snowflake_role_ownership_grant.role_prod_raw_db_sparcs_full_ar_ownership_grant, snowflake_task_grant.grant_ownership_on_prod_raw_db__sparcs_tasks]
}

resource snowflake_task_grant grant_monitor_on_prod_raw_db__vitals_tasks {
  database_name = snowflake_database.PROD_RAW_DB.name
  schema_name = snowflake_schema.PROD_RAW_DB__VITALS.name
  privilege = "MONITOR"
  roles = [snowflake_role.PROD_RAW_DB_VITALS_RW_AR.name, snowflake_role.PROD_RAW_DB_VITALS_FULL_AR.name]
  enable_multiple_grants = true
  on_all = true
  depends_on = [snowflake_schema_grant.grant_ownership_on_prod_raw_db__vitals_schema, snowflake_role_ownership_grant.role_prod_raw_db_vitals_rw_ar_ownership_grant, snowflake_task_grant.grant_ownership_on_prod_raw_db__vitals_tasks]
}

resource snowflake_task_grant grant_operate_on_prod_raw_db__vitals_tasks {
  database_name = snowflake_database.PROD_RAW_DB.name
  schema_name = snowflake_schema.PROD_RAW_DB__VITALS.name
  privilege = "OPERATE"
  roles = [snowflake_role.PROD_RAW_DB_VITALS_RW_AR.name, snowflake_role.PROD_RAW_DB_VITALS_FULL_AR.name]
  enable_multiple_grants = true
  on_all = true
  depends_on = [snowflake_schema_grant.grant_ownership_on_prod_raw_db__vitals_schema, snowflake_role_ownership_grant.role_prod_raw_db_vitals_rw_ar_ownership_grant, snowflake_task_grant.grant_ownership_on_prod_raw_db__vitals_tasks]
}

resource snowflake_task_grant grant_monitor_on_future_prod_raw_db__vitals_tasks {
  database_name = snowflake_database.PROD_RAW_DB.name
  schema_name = snowflake_schema.PROD_RAW_DB__VITALS.name

  privilege = "MONITOR"
  roles = [snowflake_role.PROD_RAW_DB_VITALS_RW_AR.name, snowflake_role.PROD_RAW_DB_VITALS_FULL_AR.name]

  on_future = true
  with_grant_option = false
  enable_multiple_grants = true
  depends_on = [snowflake_schema_grant.grant_ownership_on_prod_raw_db__vitals_schema, snowflake_role_ownership_grant.role_prod_raw_db_vitals_rw_ar_ownership_grant, snowflake_task_grant.grant_ownership_on_prod_raw_db__vitals_tasks]
}

resource snowflake_task_grant grant_operate_on_future_prod_raw_db__vitals_tasks {
  database_name = snowflake_database.PROD_RAW_DB.name
  schema_name = snowflake_schema.PROD_RAW_DB__VITALS.name

  privilege = "OPERATE"
  roles = [snowflake_role.PROD_RAW_DB_VITALS_RW_AR.name, snowflake_role.PROD_RAW_DB_VITALS_FULL_AR.name]

  on_future = true
  with_grant_option = false
  enable_multiple_grants = true
  depends_on = [snowflake_schema_grant.grant_ownership_on_prod_raw_db__vitals_schema, snowflake_role_ownership_grant.role_prod_raw_db_vitals_rw_ar_ownership_grant, snowflake_task_grant.grant_ownership_on_prod_raw_db__vitals_tasks]
}

resource snowflake_task_grant grant_ownership_on_prod_raw_db__vitals_tasks {
  database_name = snowflake_database.PROD_RAW_DB.name
  schema_name = snowflake_schema.PROD_RAW_DB__VITALS.name
  privilege = "OWNERSHIP"
  roles = [snowflake_role.PROD_RAW_DB_VITALS_FULL_AR.name]
  enable_multiple_grants = true
  on_all = true
  depends_on = [snowflake_schema_grant.grant_ownership_on_prod_raw_db__vitals_schema, snowflake_role_ownership_grant.role_prod_raw_db_vitals_full_ar_ownership_grant]
}

resource snowflake_task_grant grant_ownership_on_future_prod_raw_db__vitals_tasks {
  database_name = snowflake_database.PROD_RAW_DB.name
  schema_name = snowflake_schema.PROD_RAW_DB__VITALS.name

  privilege = "OWNERSHIP"
  roles = [snowflake_role.PROD_RAW_DB_VITALS_FULL_AR.name]

  on_future = true
  with_grant_option = false
  enable_multiple_grants = true
  depends_on = [snowflake_schema_grant.grant_ownership_on_prod_raw_db__vitals_schema, snowflake_role_ownership_grant.role_prod_raw_db_vitals_full_ar_ownership_grant, snowflake_task_grant.grant_ownership_on_prod_raw_db__vitals_tasks]
}

resource snowflake_warehouse_grant grant_usage_on_warehouse_prod_raw_compute_wh {
  warehouse_name = snowflake_warehouse.PROD_RAW_COMPUTE_WH.name
  privilege = "USAGE"

  roles = [snowflake_role.PROD_RAW_COMPUTE_WH_U_AR.name, snowflake_role.PROD_RAW_COMPUTE_WH_UM_AR.name]

  with_grant_option = false
  enable_multiple_grants = true
  depends_on = [snowflake_role_ownership_grant.role_prod_raw_compute_wh_u_ar_ownership_grant]
}

resource snowflake_warehouse_grant grant_monitor_on_warehouse_prod_raw_compute_wh {
  warehouse_name = snowflake_warehouse.PROD_RAW_COMPUTE_WH.name
  privilege = "MONITOR"

  roles = [snowflake_role.PROD_RAW_COMPUTE_WH_UM_AR.name]

  with_grant_option = false
  enable_multiple_grants = true
  depends_on = [snowflake_role_ownership_grant.role_prod_raw_compute_wh_um_ar_ownership_grant]
}

resource snowflake_warehouse_grant grant_ownership_on_warehouse_prod_raw_compute_wh {
  warehouse_name = snowflake_warehouse.PROD_RAW_COMPUTE_WH.name
  privilege = "OWNERSHIP"

  roles = [snowflake_role.PROD_RAW_COMPUTE_WH_FULL_AR.name]

  with_grant_option = false
  enable_multiple_grants = true
  depends_on = [snowflake_role_ownership_grant.role_prod_raw_compute_wh_full_ar_ownership_grant]
}

resource snowflake_role_grants role_prod_raw_db_sparcs_r_ar_grants {
  role_name = snowflake_role.PROD_RAW_DB_SPARCS_R_AR.name

  enable_multiple_grants = true
  roles = [
    snowflake_role.PROD_SPARCS_RO_FR.name,
    snowflake_role.PROD_SYSADMIN.name,
  ]
}

resource snowflake_role_grants role_prod_raw_db_sparcs_rw_ar_grants {
  role_name = snowflake_role.PROD_RAW_DB_SPARCS_RW_AR.name

  enable_multiple_grants = true
  roles = [
    snowflake_role.PROD_SPARCS_RW_FR.name,
    snowflake_role.PROD_SYSADMIN.name,
  ]
}

resource snowflake_role_grants role_prod_raw_db_sparcs_full_ar_grants {
  role_name = snowflake_role.PROD_RAW_DB_SPARCS_FULL_AR.name

  enable_multiple_grants = true
  roles = [
    snowflake_role.PROD_SPARCS_FULL_FR.name,
    snowflake_role.PROD_SYSADMIN.name,
  ]
}

resource snowflake_role_grants role_prod_raw_db_vitals_r_ar_grants {
  role_name = snowflake_role.PROD_RAW_DB_VITALS_R_AR.name

  enable_multiple_grants = true
  roles = [
    snowflake_role.PROD_VITALS_RO_FR.name,
    snowflake_role.PROD_SYSADMIN.name,
  ]
}

resource snowflake_role_grants role_prod_raw_db_vitals_rw_ar_grants {
  role_name = snowflake_role.PROD_RAW_DB_VITALS_RW_AR.name

  enable_multiple_grants = true
  roles = [
    snowflake_role.PROD_VITALS_RW_FR.name,
    snowflake_role.PROD_SYSADMIN.name,
  ]
}

resource snowflake_role_grants role_prod_raw_db_vitals_full_ar_grants {
  role_name = snowflake_role.PROD_RAW_DB_VITALS_FULL_AR.name

  enable_multiple_grants = true
  roles = [
    snowflake_role.PROD_VITALS_FULL_FR.name,
    snowflake_role.PROD_SYSADMIN.name,
  ]
}

resource snowflake_role_grants role_prod_raw_compute_wh_u_ar_grants {
  role_name = snowflake_role.PROD_RAW_COMPUTE_WH_U_AR.name

  enable_multiple_grants = true
  roles = [
    snowflake_role.PROD_SYSADMIN.name,
  ]
}

resource snowflake_role_grants role_prod_raw_compute_wh_um_ar_grants {
  role_name = snowflake_role.PROD_RAW_COMPUTE_WH_UM_AR.name

  enable_multiple_grants = true
  roles = [
    snowflake_role.PROD_SYSADMIN.name,
  ]
}

resource snowflake_role_grants role_prod_raw_compute_wh_full_ar_grants {
  role_name = snowflake_role.PROD_RAW_COMPUTE_WH_FULL_AR.name

  enable_multiple_grants = true
  roles = [
    snowflake_role.PROD_SYSADMIN.name,
  ]
}

resource snowflake_role PROD_SYSADMIN {
  name = "PROD_SYSADMIN"
}

resource snowflake_role_grants role_prod_sysadmin_grants {
  role_name = snowflake_role.PROD_SYSADMIN.name

  enable_multiple_grants = true
  roles = [
    "SYSADMIN",
  ]
}

resource snowflake_database_grant grant_ownership_on_prod_raw_db_database {
  database_name = snowflake_database.PROD_RAW_DB.name
  privilege = "OWNERSHIP"
  roles = [snowflake_role.PROD_SYSADMIN.name]

  with_grant_option = false
  enable_multiple_grants = true
  depends_on = [snowflake_role_grants.role_prod_sysadmin_grants]
}