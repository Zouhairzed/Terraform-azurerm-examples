terraform {
  required_providers {
    azuread = {
      source = "hashicorp/azuread"
      version = "1.1.1"
    }
  }
}

provider "azuread" {
}

resource "azuread_user" "user" {
  user_principal_name = "zouhair@zed.onmicrosoft.com"
  display_name        = "zouhair zed"
  mail_nickname       = "zod"
  password            = "SecretP@sswd99!"
}

resource "azuread_group" "group" {
  name    = "MyTerraformGroup"
  members = [
    azuread_user.user.object_id,
    /* more users */
  ]
}
