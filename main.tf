resource "yandex_compute_instance" "vm-1" {
  name = "${var.instance_name}"
  allow_stopping_for_update = true
  resources {
    cores  = "${var.instance_cores}"
    memory = "${var.instance_memory}"
    core_fraction = "${var.instance_core_fraction}"
  }

  boot_disk { 
    initialize_params {
      image_id = "${var.boot_disk_image_id}"
      size = "${var.boot_disk_size}"
    }
  }

  network_interface {
    subnet_id = "${yandex_vpc_subnet.subnet-1.id}"
    nat       = true
  }

  metadata = {
    ssh-keys = "ubuntu:${file("${var.ssh_puplic_key_path}")}"
  }

  provisioner "remote-exec" {
    
    connection {
      type     = "ssh"
      user     = "${var.ssh_user}"
      host     = "${yandex_compute_instance.vm-1.network_interface.0.nat_ip_address}"
      private_key = "${file("${var.ssh_private_key_path}")}"
    }
    on_failure = "continue"
    script = "./scripts/disable-selinux.sh"
  }
   provisioner "remote-exec" {
    
    connection {
      type     = "ssh"
      user     = "${var.ssh_user}"
      host     = "${yandex_compute_instance.vm-1.network_interface.0.nat_ip_address}"
      private_key = "${file("${var.ssh_private_key_path}")}"
    }
    on_failure = "continue"
    inline = [
      "sudo yum -y install wget",
      "sudo wget http://repos.1c-bitrix.ru/yum/bitrix-env.sh",
      "sudo chmod +x bitrix-env.sh",
      "sudo ./bitrix-env.sh  -p -H  ${var.bitrix_env_hostname} -M '${var.bitrix_env_mysql_password}'",
      "sudo rm -f ./bitrix-env.sh"
    ]

  }
}


resource "yandex_vpc_network" "network-1" {
  name = "${var.network}"
}

resource "yandex_vpc_subnet" "subnet-1" {
  name           = "${var.subnet}"
  zone           = "${var.zone}"
  network_id     = "${yandex_vpc_network.network-1.id}"
  v4_cidr_blocks = ["${var.v4_cidr_blocks}"]
}

