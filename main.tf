# add local variables for resource prefix
locals {
    rg_prefix = "rg"
    vnet_prefix = "vnet"
    org_prefix = "xyz"
    openai_prefix = "openai"
    aisearch_prefix = "aisearch"
    postgresql_prefix = "pg"
}

# define local variables for csv file
locals {
    resource_groups_csv = csvdecode(file("modules/resource_groups/data.csv"))
    openai_accounts_csv = csvdecode(file("modules/openai/accounts/data.csv"))
    openai_models_csv = csvdecode(file("modules/openai/models/data.csv"))
    aisearch_csv = csvdecode(file("modules/aisearch/data.csv"))
    postgresql_csv = csvdecode(file("modules/databases/postgresql/data.csv"))
    }

# create resource group
resource "azurerm_resource_group" "rg" {
    for_each = { for rg in local.resource_groups_csv : rg.s_no => rg }
    name     = "${local.rg_prefix}-${local.org_prefix}-${each.value.name}-${each.value.location}-${each.value.instance}"
    location = each.value.location
}

# create openai account
module "openai" {
    source = "./modules/openai/accounts"
    for_each = { for openai in local.openai_accounts_csv : openai.s_no => openai }
    openai_account_name = "${local.openai_prefix}-${local.org_prefix}-${each.value.account}-${each.value.id}"
    location = each.value.location
    openai_sku = each.value.sku
    openai_kind = each.value.kind
    resource_group_name = "${each.value.rg}"
    depends_on = [ azurerm_resource_group.rg ]
}

# create openai model
module "openai_model" {
    source = "./modules/openai/models"
    for_each = { for openai in local.openai_models_csv : openai.s_no => openai }
    openai_deployment_name = "${local.openai_prefix}-${local.org_prefix}-${each.value.name}-${each.value.id}"
    openai_deployment_location = each.value.location
    openai_model_name = each.value.model
    capacity = each.value.capacity
    openai_account_name = each.value.account
    resource_group_name = "${each.value.rg}"
    depends_on = [ module.openai ]
}

# create aisearch
module "aisearch" {
    source = "./modules/aisearch"
    for_each = { for aisearch in local.aisearch_csv : aisearch.s_no => aisearch }
    aisearch_name = "${local.aisearch_prefix}-${local.org_prefix}-${each.value.name}-${each.value.id}"
    location = each.value.location
    resource_group_name = "${each.value.rg}"
    aisearch_sku = each.value.sku
    depends_on = [ azurerm_resource_group.rg ]
}

# create postgresql
module "postgresql" {
    source = "./modules/databases/postgresql"
    for_each = { for postgresql in local.postgresql_csv : postgresql.s_no => postgresql }
    postgresql_name = "${local.postgresql_prefix}-${local.org_prefix}-${each.value.name}-${each.value.id}"
    location = each.value.location
    resource_group_name = "${each.value.rg}"
    postgresql_sku = each.value.sku
    postgresql_version = each.value.db_version
    storage_mb = each.value.storage_mb
    key_vault_id = each.value.keyvault
    pg_server_admin_login = each.value.user_key_name
    pg_server_admin_password = each.value.password_key_name
    depends_on = [ azurerm_resource_group.rg ]
}