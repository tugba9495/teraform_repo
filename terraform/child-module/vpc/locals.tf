locals {
  common_tags = {
    Owner     = "tugba"
    ManagedBy = "https://github.com/tugba9495/terraform_repo"
  }
  appname = "youtube" 

  name = local.appname
}
