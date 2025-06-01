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
  default = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIMDyMDUhk3n18kGuC7u3oEJRqH8e7PEW7joq5cR2OfLD qsyoma@Qsyoma"
}

variable "user_name" {
  default = "ubuntu"
}

variable "ip_adres" {
  default = "192.168.122.233:22"

}
