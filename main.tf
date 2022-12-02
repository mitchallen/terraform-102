# Configure Kubernetes provider and connect to the Kubernetes API server
provider "kubernetes" {
  host = "https://localhost:6443"
  config_context_cluster = "docker-desktop"
  config_path            = "~/.kube/config"
}

# Create an Nginx pod
resource "kubernetes_pod" "nginx_server" {
  metadata {
    name = "terraform-example"
    labels = {
      App = "nginx_server"
    }
  }

  spec {
    container {
      image = "nginx:1.15.3"
      name  = "example"
      port {
        container_port = 80
      }
    }
  }
}

# Create a service
resource "kubernetes_service" "nginx" {
  metadata {
    name = "terraform-example"
  }
  spec {
    selector = {
      App = "${kubernetes_pod.nginx_server.metadata.0.labels.App}"
    }
    port {
      port = 80
      target_port = 80
    }

    type = "NodePort"
  }
}
