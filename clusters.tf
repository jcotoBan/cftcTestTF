terraform {
  required_providers {
    linode = {
      source = "linode/linode"
    }
  }
}

//Karmada manager cluster

resource "linode_lke_cluster" "main_cluster" {
    k8s_version = var.main_cluster[0].k8s_version
    label = var.main_cluster[0].label
    region = var.main_cluster[0].region

    dynamic "pool" {
        for_each = var.main_cluster[0].pools
        content {
            type  = pool.value["type"]
            count = pool.value["count"]
        }
    }
}

output "kubeconfig" {
   value = linode_lke_cluster.main_cluster.kubeconfig
   sensitive = true
}

variable "main_cluster"{}

