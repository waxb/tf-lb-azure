output "backend_address_pool_id" {
  description = "ID of backend address pool"
  value       = azurerm_lb_backend_address_pool.backend_pool.id
}

output "lb_frontend_ip" {
  value       = azurerm_lb.load_balancer.private_ip_address
}
