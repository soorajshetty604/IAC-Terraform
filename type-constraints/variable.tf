#string
variable "prefix" {
  type = string
  default = "testing"
}

#list --> it should be same data type
variable "location" {
  type = list(string)
  default = [ "East US", "West US", "Canada Central" ]
}

#bool
variable "is_os_auth_enabled" {
  type = bool
  default = false
}

#map - should be same data type
variable "tags" {
  type = map(string)
  default = {
    "environment": "dev",
    "operator": "example"
  }
}



