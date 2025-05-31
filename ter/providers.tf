terraform {
  required_providers {
    libvirt = {
      source  = "dmacvicar/libvirt"
      version = " 0.8.3 "
    }
  }
}

provider "libvirt" {
  uri = "qemu+ssh://qsyoma@213.171.25.115/system"
}
