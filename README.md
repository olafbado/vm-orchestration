### AWS Auto-Scaling VM Orchestration with Terraform
This project automates the orchestration of virtual machines (VMs) on AWS using a combination of Terraform, Packer, Bash scripting, AWS Application Load Balancer (ALB), and Auto Scaling Groups (ASG). The goal is to create a scalable and automated infrastructure that dynamically adjusts to demand by launching new VMs or terminating unused ones.

### Setup Instructions

#### 1. Replace AWS Profile in main.tf and sample-app.pkr.hcl with your own
#### 2. Use Packer to build VM image
```bash
    packer init sample-app.pkr.hcl
    packer build sample-app.pkr.hcl
```
#### 3. Replace ami_id in main.tf with AMI ID generated from the Packer build. 
#### 4. Provision infrastructure using Terraform
```bash
    terraform init
    terraform apply
```
#### 5. Clean Up
```bash
    terraform destroy
```