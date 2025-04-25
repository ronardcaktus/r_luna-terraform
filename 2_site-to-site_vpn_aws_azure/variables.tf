#######################
# Azure account setup
#######################
variable "subscription_id" {
  type        = string
  description = "Azure Subscription ID."
}

variable "tenant_id" {
  type        = string
  description = "Azure Subscription ID."
}

variable "azurerm_public_ips" {
  type        = number
  default     = 2
  description = "The number of Azure public IPs to create."
}
