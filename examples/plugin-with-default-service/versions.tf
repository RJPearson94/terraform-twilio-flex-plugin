terraform {
  required_version = ">= 0.14"

  required_providers {
    twilio = {
      source  = "RJPearson94/twilio"
      version = ">= 0.11.0"
    }
  }
}
