variable "prefixes" {
  type = object({
    application = string
    environment = string
    location    = string
  })

  description = "List of prefixes for use in object naming."
}

variable "azure_region" {
  description = "Azure region to store resources in."
}

variable "azure_tags" {
  type        = map(string)
  description = "Tags for use on Azure resources."
}
