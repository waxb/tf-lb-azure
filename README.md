[![Build Status](http://localhost:6699/clops/buildStatus/icon?job=ans_rol_test)](http://localhost:6699/clops/job/ans_rol_test/)
[![terraform](https://img.shields.io/badge/terraform-0.12-brightgreen.svg)](https://www.terraform.io/upgrade-guides/0-12.html)
[![azurerm](https://img.shields.io/badge/azurerm-1.29-brightgreen.svg)](https://github.com/terraform-providers/terraform-provider-azurerm)
[![azurerm](https://img.shields.io/badge/azurerm-2.0-orange.svg)](https://www.terraform.io/docs/providers/azurerm/guides/2.0-upgrade-guide.html)

## Terraform module Virtual Machines(s) [Linux]
This module creates virtual machines with attached NICs to existing subnet, OS and data disk(s).

# Terraform module template
Here goes short description

## Global Inputs [default:string]
### location
The geolocation where the resources are deployed
### rg_name
The name of resource group where the resources are deployed
### subnet_id
Full path/ID of subnet[N] to attach NICs
### cost
CostCenter tag on resource(group)[s]
### assessment_group
assessment-id tag on resource(group)[s]
### owner
Owner tag on resource(group)[s]

## Local Inputs
### loadbalancer_name
Name of the load balancer
### protocol
Protocols to balance
### ports
Ports to balance

## Outputs
### backend_address_pool_id
ID of backend address pool

## Resources
This is the list of resources that the module may create. The module can create zero or more of each of these resources depending on the  count  value. The count value is determined at runtime. The goal of this page is to present the types of resources that may be created.

This list contains all the resources this plus any submodules may create. When using this module, it may create less resources if you use a submodule.

This module defines 4 resources .
 - azurerm_lb
 - azurerm_lb_backend_address_pool
 - azurerm_lb_rule
 - azurerm_lb_probe
