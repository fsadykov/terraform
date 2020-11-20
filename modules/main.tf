
## Define module 
module my_network {
  source = "./modules/example"
}

## Getting output
output name {
  value       = module.my_network.vnet_id
}
