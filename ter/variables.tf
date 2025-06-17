variable "vm_name" {
  default = "todo-vm"
}

variable "vcpu" {
  default = 2
}

variable "memory" {
  default = 3072
}
variable "ssh_public_key" {
  type        = string
  description = "SSH public key"
  sensitive   = true 
}

variable "user_name" {
  default = "ubuntu"
}

variable "ip_adres" {
  default = "192.168.122.233:22"

}
