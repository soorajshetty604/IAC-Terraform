variable "geo_location" {
   description = "geographical location where resources to be created"
   type = string
   default = "WEST US"
}

variable "environment" {
  description = "type of environment"
  type = string
  default = "staging"  
}