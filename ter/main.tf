resource "libvirt_volume" "ubuntu_qcow2" {
  name   = "${var.vm_name}-disk.qcow2"
  pool   = "default" # Имя пула Libvirt (проверьте `virsh pool-list`)
  source = "https://cloud-images.ubuntu.com/focal/current/focal-server-cloudimg-amd64-disk-kvm.img"
  format = "qcow2"
}

resource "libvirt_cloudinit_disk" "cloudinit" {
  name      = "${var.vm_name}-cloudinit.iso"
  pool      = "default"
  user_data = <<-EOF
    #cloud-config
    hostname: ${var.vm_name}
    ssh_authorized_keys:
      - ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIMDyMDUhk3n18kGuC7u3oEJRqH8e7PEW7joq5cR2OfLD qsyoma@Qsyoma

  EOF
}

resource "libvirt_domain" "todo_vm" {
  name      = var.vm_name
  vcpu      = var.vcpu
  memory    = var.memory
  autostart = true

  disk {
    volume_id = libvirt_volume.ubuntu_qcow2.id
  }

  cloudinit = libvirt_cloudinit_disk.cloudinit.id

  network_interface {
    network_name = "default" # Имя сети Libvirt (`virsh net-list`)
  }

  console {
    type        = "pty"
    target_port = "0"
  }
}
