# Hashicorp-Stack-Demo(Nomad-Consul)

This demonstration showcases a simplified implementation of [Nomad](https://www.nomadproject.io/) and [Consul](https://www.consul.io/) for service deployment and discovery. It utilizes a single machine for both Nomad server and client, as well as Consul server and client. Two Docker images are leveraged: a web-frontend built with React and a Node.js backend, both retrieved from Docker Hub. Separate Nomad jobs are defined for the frontend, backend, and an Nginx service for load balancing. Consul acts as the service registry, allowing the Nginx job to discover the frontend and backend services within the Nomad cluster. This setup provides a basic example of how Nomad and Consul can be used to manage and orchestrate containerized applications.

## Familiarity with (not mandatory):

• Understanding Containerization (Docker)

• Service Orchestration Fundamentals (Kubernetes)

• Basic Networking Knowledge

## Table of Contents

- [Installation](#installation)
  - [Nomad](#nomad)
  - [Consul](#consul)
- [Usage](#usage)
  - [Nomad Server and Client](#nomad-server-and-client)
  - [Consul Agent](#consul-agent)
  - [Running a Nomad Job](#running-a-nomad-job)
- [Managing Services and Important Commands](#managing-services-and-important-commands)
- [Learning Resources](learning-resources)

## Installation

### Nomad

1. **Download and Install Nomad**:
   - Visit the [Nomad download page](https://developer.hashicorp.com/nomad/docs/install).
   - Choose the appropriate package for your system and follow the installation instructions.

2. **Check Nomad Version**:
   ```bash
   nomad version
   ```

### Consul

1. **Download and Install Consul**:
   - Visit the [Consul download page](https://developer.hashicorp.com/consul/docs/install).
   - Choose the appropriate package for your system and follow the installation instructions.

2. **Check Consul Version**:
   ```bash
   consul version
   ```

## Usage

#### Nomad Server and Client
1. **Run Nomad Client Agent**:
   ```bash
   cd nomad && nohup sudo nomad agent -config client.hcl &
   ```

2. **Run Nomad Server Agent**:
   ```bash
   cd nomad && nohup sudo nomad agent -config server.hcl &
   ```

#### Consul Agent
1. **Run Consul Dev Agent**:
   ```bash
   nohup consul agent -dev -client 0.0.0.0 &
   ```
   
#### Running a Nomad Job
1. **Submit Jobs to Nomad**:
    - Submit the frontend-website(ReactJS) job to Nomad:
   ```bash
    sudo nomad run frontend.nomad.hcl 
   ```
   - Submit the backend-website(NodeJS) job to Nomad:
     (Wait a few seconds for the above job to become healthy before running the next command.)
   ```bash
    sudo nomad run backend.nomad.hcl 
   ```  
   - Submit the nginx job to Nomad:
     (Wait a few seconds for the above job to become healthy before running the next command.)
   ```bash
    sudo nomad run nginx.nomad.hcl 
   ```

Cheers! 🎉 You can now access your deployed website.

  **To access the website**:
  1. On a cloud instance (AWS/Azure/GCP): open your browser and enter http://public-ip:8080
  2. On a local machine: open your browser and enter http://localhost:8088


## Managing Services and Important Commands
1. **Accessing the Nomad Web UI**: http://localhost:4646
2. **Registering a Job**: nomad job run example.nomad.hcl
3. **Displays the status of all registered jobs**: nomad job status
4. **Inspecting a Specific Job**: nomad job status
5. **Stop a Nomad Job**: nomad job stop -purge <job-name>
6. **Listing Allocations**: nomad alloc status
7. **Inspecting a Specific Allocation**: nomad alloc status <alloc-id>
8. **Viewing Logs for a Job**: nomad job logs <job-name>
9. **Viewing Logs for an Allocation**: nomad alloc logs <alloc-id>
10.  **List Nomad Processes**: ps aux | grep nomad
11. **Kill Nomad Processe**: sudo killall nomad
12. **Accessing the Consul Web UI**: http://localhost:8500
13. **Leave/Stop the Consul Cluster**: consul leave
14. **Display Consul Status and Metrics**: consul info
15. **View Members in the Cluster**: consul members
16. **List Services Registered with Consul:**: consul catalog services
17. **List Nodes for a Specific Service**: consul catalog nodes -service=<service_name>
18. **Check Consul Version**: consul version

## Learning Resources

HashiCorp provides excellent documentation for both 
 
 • Nomad https://developer.hashicorp.com/nomad and 
 • Consul https://developer.hashicorp.com/consul/docs. 
 
 These resources are a great starting point to learn about their features and configuration options.
