output "public_ssh_key" {
  description = "Публичный SSH ключ, используемый для доступа к VM"
  value       = var.ssh_public_key
}

output "username" {
  description = "Имя пользователя"
  value       = var.user_name
}

output "ip" {
  description = "ip адрес"
  value       = var.ip_adres
}
