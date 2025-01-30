

variable "resourcegroup" {
  description = "The name of the resource group"
  type        = string
}


variable "keyvault" {
  description = "The name of the Key Vault"
  type        = string
}

variable "secretname" {
  description = "The name of the secret"
  type        = string
}

variable "secretvalue" {
  description = "The value of the secret"
  type        = string
}

variable "secret_details" {
  description = "List of roles and object IDs for role assignments"
  type = list(object({
    secret_objectid = string
    role            = string
  }))
}
