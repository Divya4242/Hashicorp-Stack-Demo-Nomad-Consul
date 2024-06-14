# Nomad-Consul-Nginx

This repository provides instructions for setting up a basic environment using HashiCorp's Nomad and Consul. This setup will help you deploy and manage services with Nomad and service discovery with Consul.

## Table of Contents

- [Installation](#installation)
  - [Nomad](#nomad)
  - [Consul](#consul)
- [Usage](#usage)
  - [Nomad Server and Client](#nomad-server-and-client)
  - [Consul Agent](#consul-agent)
  - [Running a Nomad Job](#running-a-nomad-job)
- [Managing Services](#managing-services)
  - [Stopping Nomad Jobs](#stopping-nomad-jobs)
  - [Stopping Nomad](#stopping-nomad)
  - [Stopping Consul](#stopping-consul)
  - [Consul Commands](#consul-commands)

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

### Usage

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
1. **Submit a Nomad Job**:
    - Submit the frontend-website(ReactJS) job to Nomad:
   ```bash
    sudo nomad run frontend.nomad.hcl 
   ```
   - Submit the backend-website(NodeJS) job to Nomad:
   ```bash
    sudo nomad run backend.nomad.hcl 
   ```  
   - Submit the nginx job to Nomad:
   ```bash
    sudo nomad run nginx.nomad.hcl 
   ```

   This README should provide a clear and concise guide for setting up and managing Nomad and Consul within your project.
