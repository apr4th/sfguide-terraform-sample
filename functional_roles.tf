resource snowflake_role DEV_SPARCS_FULL_FR {
  name = "DEV_SPARCS_FULL_FR"
}

resource snowflake_role_ownership_grant role_dev_sparcs_full_fr_ownership_grant {
  on_role_name = snowflake_role.DEV_SPARCS_FULL_FR.name
  to_role_name = "USERADMIN"
  revert_ownership_to_role_name = "SYSADMIN"
}

resource snowflake_role_grants role_dev_sparcs_full_fr_grants {
  role_name = snowflake_role.DEV_SPARCS_FULL_FR.name

  enable_multiple_grants = true
  roles = [
    snowflake_role.DEV_SYSADMIN.name,
  ]
}

resource snowflake_role DEV_SPARCS_RO_FR {
  name = "DEV_SPARCS_RO_FR"
}

resource snowflake_role_ownership_grant role_dev_sparcs_ro_fr_ownership_grant {
  on_role_name = snowflake_role.DEV_SPARCS_RO_FR.name
  to_role_name = "USERADMIN"
  revert_ownership_to_role_name = "SYSADMIN"
}

resource snowflake_role_grants role_dev_sparcs_ro_fr_grants {
  role_name = snowflake_role.DEV_SPARCS_RO_FR.name

  enable_multiple_grants = true
  roles = [
    snowflake_role.DEV_SYSADMIN.name,
  ]
}

resource snowflake_role DEV_SPARCS_RW_FR {
  name = "DEV_SPARCS_RW_FR"
}

resource snowflake_role_ownership_grant role_dev_sparcs_rw_fr_ownership_grant {
  on_role_name = snowflake_role.DEV_SPARCS_RW_FR.name
  to_role_name = "USERADMIN"
  revert_ownership_to_role_name = "SYSADMIN"
}

resource snowflake_role_grants role_dev_sparcs_rw_fr_grants {
  role_name = snowflake_role.DEV_SPARCS_RW_FR.name

  enable_multiple_grants = true
  roles = [
    snowflake_role.DEV_SYSADMIN.name,
  ]
}

resource snowflake_role DEV_VITALS_FULL_FR {
  name = "DEV_VITALS_FULL_FR"
}

resource snowflake_role_ownership_grant role_dev_vitals_full_fr_ownership_grant {
  on_role_name = snowflake_role.DEV_VITALS_FULL_FR.name
  to_role_name = "USERADMIN"
  revert_ownership_to_role_name = "SYSADMIN"
}

resource snowflake_role_grants role_dev_vitals_full_fr_grants {
  role_name = snowflake_role.DEV_VITALS_FULL_FR.name

  enable_multiple_grants = true
  roles = [
    snowflake_role.DEV_SYSADMIN.name,
  ]
}

resource snowflake_role DEV_VITALS_RO_FR {
  name = "DEV_VITALS_RO_FR"
}

resource snowflake_role_ownership_grant role_dev_vitals_ro_fr_ownership_grant {
  on_role_name = snowflake_role.DEV_VITALS_RO_FR.name
  to_role_name = "USERADMIN"
  revert_ownership_to_role_name = "SYSADMIN"
}

resource snowflake_role_grants role_dev_vitals_ro_fr_grants {
  role_name = snowflake_role.DEV_VITALS_RO_FR.name

  enable_multiple_grants = true
  roles = [
    snowflake_role.DEV_SYSADMIN.name,
  ]
}

resource snowflake_role DEV_VITALS_RW_FR {
  name = "DEV_VITALS_RW_FR"
}

resource snowflake_role_ownership_grant role_dev_vitals_rw_fr_ownership_grant {
  on_role_name = snowflake_role.DEV_VITALS_RW_FR.name
  to_role_name = "USERADMIN"
  revert_ownership_to_role_name = "SYSADMIN"
}

resource snowflake_role_grants role_dev_vitals_rw_fr_grants {
  role_name = snowflake_role.DEV_VITALS_RW_FR.name

  enable_multiple_grants = true
  roles = [
    snowflake_role.DEV_SYSADMIN.name,
  ]
}

resource snowflake_role PROD_SPARCS_FULL_FR {
  name = "PROD_SPARCS_FULL_FR"
}

resource snowflake_role_ownership_grant role_prod_sparcs_full_fr_ownership_grant {
  on_role_name = snowflake_role.PROD_SPARCS_FULL_FR.name
  to_role_name = "USERADMIN"
  revert_ownership_to_role_name = "SYSADMIN"
}

resource snowflake_role_grants role_prod_sparcs_full_fr_grants {
  role_name = snowflake_role.PROD_SPARCS_FULL_FR.name

  enable_multiple_grants = true
  roles = [
    snowflake_role.PROD_SYSADMIN.name,
  ]
}

resource snowflake_role PROD_SPARCS_RO_FR {
  name = "PROD_SPARCS_RO_FR"
}

resource snowflake_role_ownership_grant role_prod_sparcs_ro_fr_ownership_grant {
  on_role_name = snowflake_role.PROD_SPARCS_RO_FR.name
  to_role_name = "USERADMIN"
  revert_ownership_to_role_name = "SYSADMIN"
}

resource snowflake_role_grants role_prod_sparcs_ro_fr_grants {
  role_name = snowflake_role.PROD_SPARCS_RO_FR.name

  enable_multiple_grants = true
  roles = [
    snowflake_role.PROD_SYSADMIN.name,
  ]
}

resource snowflake_role PROD_SPARCS_RW_FR {
  name = "PROD_SPARCS_RW_FR"
}

resource snowflake_role_ownership_grant role_prod_sparcs_rw_fr_ownership_grant {
  on_role_name = snowflake_role.PROD_SPARCS_RW_FR.name
  to_role_name = "USERADMIN"
  revert_ownership_to_role_name = "SYSADMIN"
}

resource snowflake_role_grants role_prod_sparcs_rw_fr_grants {
  role_name = snowflake_role.PROD_SPARCS_RW_FR.name

  enable_multiple_grants = true
  roles = [
    snowflake_role.PROD_SYSADMIN.name,
  ]
}

resource snowflake_role PROD_VITALS_FULL_FR {
  name = "PROD_VITALS_FULL_FR"
}

resource snowflake_role_ownership_grant role_prod_vitals_full_fr_ownership_grant {
  on_role_name = snowflake_role.PROD_VITALS_FULL_FR.name
  to_role_name = "USERADMIN"
  revert_ownership_to_role_name = "SYSADMIN"
}

resource snowflake_role_grants role_prod_vitals_full_fr_grants {
  role_name = snowflake_role.PROD_VITALS_FULL_FR.name

  enable_multiple_grants = true
  roles = [
    snowflake_role.PROD_SYSADMIN.name,
  ]
}

resource snowflake_role PROD_VITALS_RO_FR {
  name = "PROD_VITALS_RO_FR"
}

resource snowflake_role_ownership_grant role_prod_vitals_ro_fr_ownership_grant {
  on_role_name = snowflake_role.PROD_VITALS_RO_FR.name
  to_role_name = "USERADMIN"
  revert_ownership_to_role_name = "SYSADMIN"
}

resource snowflake_role_grants role_prod_vitals_ro_fr_grants {
  role_name = snowflake_role.PROD_VITALS_RO_FR.name

  enable_multiple_grants = true
  roles = [
    snowflake_role.PROD_SYSADMIN.name,
  ]
}

resource snowflake_role PROD_VITALS_RW_FR {
  name = "PROD_VITALS_RW_FR"
}

resource snowflake_role_ownership_grant role_prod_vitals_rw_fr_ownership_grant {
  on_role_name = snowflake_role.PROD_VITALS_RW_FR.name
  to_role_name = "USERADMIN"
  revert_ownership_to_role_name = "SYSADMIN"
}

resource snowflake_role_grants role_prod_vitals_rw_fr_grants {
  role_name = snowflake_role.PROD_VITALS_RW_FR.name

  enable_multiple_grants = true
  roles = [
    snowflake_role.PROD_SYSADMIN.name,
  ]
}