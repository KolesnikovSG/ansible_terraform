data "template_file" "user_data" {
  template = file("${path.module}/cloud_init.cfg")
  vars = {
    vm_name = var.vm_name
  }
}

resource "libvirt_volume" "ubuntu_qcow2" {
  name   = "${var.vm_name}-disk.qcow2"
  pool   = "default" 
  source = "https://cloud-images.ubuntu.com/focal/current/focal-server-cloudimg-amd64-disk-kvm.img"
  format = "qcow2"
}

resource "libvirt_cloudinit_disk" "cloudinit" {
  name      = "${var.vm_name}-cloudinit.iso"
  pool      = "default"
  user_data = data.template_file.user_data.rendered
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
    network_name = "default" 
  }

  console {
    type        = "pty"
    target_port = "0"
  }
}
