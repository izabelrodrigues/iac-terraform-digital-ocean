# Bloco de config conforme documentação
terraform {
  required_providers {
    digitalocean = {
      source = "digitalocean/digitalocean"
      version = "~> 2.0"
    }
  }
}

################################# Bloco variáveis #################################

variable "do_token" {}
variable "k8s_name" {}
variable "region" {}

################################# Bloco providers #################################

provider "digitalocean" {
  token = var.do_token
}

################################# Bloco recursos #################################

#Cluster
resource "digitalocean_kubernetes_cluster" "k8s_iniciativa_devops" {
  name   = var.k8s_name # nome do cluster na digital ocean
  region = var.region
  version = "1.22.8-do.1"

  node_pool {
    name       = "default"
    size       = "s-2vcpu-4gb"
    node_count = 2
  }
}

#Node pool adicional
resource "digitalocean_kubernetes_node_pool" "node_premium" {
  cluster_id = digitalocean_kubernetes_cluster.k8s_iniciativa_devops.id

  name       = "premium"
  size       = "s-4vcpu-8gb"
  node_count = 2
  tags       = ["backend"]

}

################################# Bloco outputs #################################

output "kube_endpoint" {
    value = digitalocean_kubernetes_cluster.k8s_iniciativa_devops.endpoint
}