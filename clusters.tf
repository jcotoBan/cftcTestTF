terraform {
  required_providers {
    linode = {
      source = "linode/linode"
    }
  }
}

//Karmada manager cluster

resource "linode_lke_cluster" "main_cluster" {
    k8s_version = var.region_manager_lke_cluster[0].k8s_version
    label = var.region_manager_lke_cluster[0].label
    region = var.region_manager_lke_cluster[0].region

    dynamic "pool" {
        for_each = var.region_manager_lke_cluster[0].pools
        content {
            type  = pool.value["type"]
            count = pool.value["count"]
        }
    }
}

