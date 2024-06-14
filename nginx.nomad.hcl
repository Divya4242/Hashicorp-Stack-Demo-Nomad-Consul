job "nginx" {
  datacenters = ["dc1"]

  group "nginx" {
    count = 1

    network {
      port "http" {
        static = 8088
      }
    }

    service {
      name = "nginx"
      port = "http"
    }

    task "nginx" {
      driver = "docker"

      config {
        image = "nginx"

        ports = ["http"]

        volumes = [
          "local:/etc/nginx/conf.d",
        ]
      }

template {
        data = <<EOF
# Backend upstream configuration
upstream backend {
{{ range service "node-backend" }}
  server {{ .Address }}:{{ .Port }};
{{ else }}server 127.0.0.1:65535; # force a 502
{{ end }}
}

# Frontend upstream configuration
upstream frontend {
{{ range service "react-frontend" }}
  server {{ .Address }}:{{ .Port }};
{{ else }}server 127.0.0.1:65535; # force a 502
{{ end }}
}

# Nginx server block
server {
   listen 8088;

   # Backend route
   location /api/ {
      proxy_pass http://backend;
      rewrite ^/api/(.*) /$1 break;
   }

   # Frontend route
   location / {
      proxy_pass http://frontend;
   }
}
EOF
        destination   = "local/load-balancer.conf"
        change_mode   = "signal"
        change_signal = "SIGHUP"
      }
    }
  }
}
