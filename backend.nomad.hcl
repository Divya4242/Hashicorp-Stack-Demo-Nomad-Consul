job "node-backend" {
  datacenters = ["dc1"]

  group "demo" {
    count = 2

    network {
      port "http" {
        to = 8000
      }
    }

    service {
      name = "node-backend"
      port = "http"
      check {
        type     = "http"
        path     = "/"
        interval = "2s"
        timeout  = "2s"
      }
    }

    task "server" {	
      driver = "docker"

      config {
        image = "divyapatel42/ecommerce-webapp:backendv1"
        ports = ["http"]
      }
    }
  }
}
