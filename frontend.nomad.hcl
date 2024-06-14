job "react-frontend" {
  datacenters = ["dc1"]
  type = "service"

  group "demo" {
    count = 1

    network {
      port "http" {
        to = 3000
      }
    }

    service {
      name = "react-frontend"
      port = "http"
      check {
        type     = "http"
        path     = "/"
        interval = "2s"
        timeout  = "2s"

      }
    }

    task "react-frontend" {	
      driver = "docker"
	
      resources {
        cpu    = 100
        memory = 1024
	}

      config {
        image = "divyapatel42/ecommerce-webapp:frontendv1"
        ports = ["http"]
	force_pull = false # You can also set to true
      }
	env {
          REACT_APP_API_URL = "http://localhost:8088/api/"
        }

    }
  }
}
