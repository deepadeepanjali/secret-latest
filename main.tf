# Fetch keyvault details by keyvaut names
data "azurerm_key_vault" "keyvault" {
  name                = var.keyvault                 # Use each Key Vault name
  resource_group_name = var.resourcegroup   # Provide the resource group name where the Key Vaults exist
}

resource "azurerm_key_vault_secret" "secret" {
  name         = var.secretname 
  value        =  var.secretvalue
  key_vault_id = data.azurerm_key_vault.keyvault.id
}


# Assign roles to the secrets using azurerm_role_assignment
resource "azurerm_role_assignment" "role_assignment" {
  for_each = var.secret_details

  principal_id   = each.value.secret_objectid
  role_definition_name = each.value.role
  scope           = azurerm_key_vault_secret.secret.id
}
