module "rg" {
  source = "../child_mod/rg"
  rg = {
    rg1 = {
      name     = "rg1"
      location = "centralindia"
    }
    rg2 = {
      name     = "rg2"
      location = "centralindia"
    }
  }
}

module "storage" {
  depends_on = [module.rg]
  source     = "../child_mod/storage"
  storage = {
    storage1 = {
      name                = "rgstore121"
      resource_group_name = module.rg.rg1.name
      location            = module.rg.rg1.location
      accountTier         = "Standard"
      accountRepTyp       = "LRS"
    }
    storage2 = {
      name                = "rgstore212"
      resource_group_name = module.rg.rg2.name
      location            = module.rg.rg2.location
      accountTier         = "Standard"
      accountRepTyp       = "LRS"
    }
  }
}

module "container" {
  depends_on = [module.storage]
  source     = "../child_mod/container"
  container = {
    container1 = {
      name                 = "conatiner1"
      storage_account_name = module.storage.storage1.name
      resource_group_name  = module.rg.rg1.name
      containerAccTyp      = "private"
    }
    container2 = {
      name                 = "container2"
      storage_account_name = module.storage.storage2.name
      resource_group_name  = module.rg.rg2.name
      containerAccTyp      = "private"
    }
  }

}

module "vnet" {
  depends_on = [module.rg]
  source     = "../child_mod/vnet"
  vnet = {
    vnet1 = {
      name                = "vnet1"
      resource_group_name = module.rg.rg1.name
      location            = module.rg.rg1.location
      address_space       = "10.143.0.0/16"
    }
    vnet2 = {
      name                = "vnet2"
      resource_group_name = module.rg.rg2.name
      location            = module.rg.rg2.location
      address_space       = "10.56.0.0/16"
    }
  }
}

module "subnet" {
  depends_on = [module.vnet]
  source     = "../child_mod/subnet"
  subnet = {
    subnet1 = {
      name                 = "subnet1"
      resource_group_name  = module.rg.rg1.name
      virtual_network_name = module.vnet.vnet1.name
      address_prefix       = "10.143.0.0/24"
    }
    subnet2 = {
      name                 = "subnet2"
      resource_group_name  = module.rg.rg1.name
      virtual_network_name = module.vnet.vnet1.name
      address_prefix       = "10.143.1.0/24"
    }
    subnet3 = {
      name                 = "subnet3"
      resource_group_name  = module.rg.rg1.name
      virtual_network_name = module.vnet.vnet1.name
      address_prefix       = "10.143.2.0/24"
    }
    subnet4 = {
      name                 = "subnet4"
      resource_group_name  = module.rg.rg1.name
      virtual_network_name = module.vnet.vnet1.name
      address_prefix       = "10.143.3.0/24"
    }
  }
}
