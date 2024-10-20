### AWS Auto-Scaling VM Orchestration with Terraform
This project automates the orchestration of virtual machines (VMs) on AWS using a combination of Terraform, Packer, Bash scripting, AWS Application Load Balancer (ALB), and Auto Scaling Groups (ASG). The goal is to create a scalable and automated infrastructure that dynamically adjusts to demand by launching new VMs or terminating unused ones. This setup allows for an efficient and cost-effective way to handle varying workloads in production or development environments.

### Setup Instructions

#### 1. Replace AWS Profile in main.tf and sample-app.pkr.hcl with your own
#### 2. Use Packer to build VM image
```bash
    packer init sample-app.pkr.hcl
    packer build sample-app.pkr.hcl
```
#### 4. Replace ami_id in main.tf with AMI ID generated from the Packer build. 
#### 3. Provision infrastructure using Terraform
```bash
    terraform init
    terraform apply
```