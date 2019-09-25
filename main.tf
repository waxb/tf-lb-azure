resource "azurerm_lb" "load_balancer" {
  name                = var.loadbalancer_name
  location            = var.location
  resource_group_name = var.rg_name

  frontend_ip_configuration {
    name                          = "loadbalancerFE"
    public_ip_address_id          = var.pip_id
  }

  tags = {
    CostCenter       = var.cost
    assessment-group = var.assessment_group
    Owner            = var.owner
  }
}

resource "azurerm_lb_backend_address_pool" "backend_pool" {
  resource_group_name = var.rg_name
  loadbalancer_id     = azurerm_lb.load_balancer.id
  name                = "BackendPool"
}

resource "azurerm_lb_rule" "lb_rules" {
  resource_group_name            = var.rg_name
  loadbalancer_id                = azurerm_lb.load_balancer.id
  name                           = "rule_${count.index}"
  frontend_ip_configuration_name = "loadbalancerFE"
  protocol                       = var.protocol
  frontend_port                  = var.ports[count.index]
  backend_port                   = var.ports[count.index]
  enable_floating_ip             = false
  backend_address_pool_id        = azurerm_lb_backend_address_pool.backend_pool.id
  idle_timeout_in_minutes        = 5
  probe_id                       = element(azurerm_lb_probe.lb_probes.*.id, count.index)
  count                          = length(var.ports)
  depends_on                     = [azurerm_lb_probe.lb_probes]
}

#TODO: ports/protocols -> map v0.12
resource "azurerm_lb_probe" "lb_probes" {
  resource_group_name = var.rg_name
  loadbalancer_id     = azurerm_lb.load_balancer.id
  name                = "${var.protocol}${var.ports[count.index]}"
  protocol            = var.protocol
  port                = var.ports[count.index]
  interval_in_seconds = 5
  number_of_probes    = 2
  count               = length(var.ports)
}

