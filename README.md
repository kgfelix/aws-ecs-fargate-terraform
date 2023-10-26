# AWS ECS FARGATE WITH TERRAFORM 

## Description

This module provides the necessary components to create a container infrastructure on AWS with ECS and Fargate.

## Preconditions and Assumptions

The module depends on the following components already created in the environment:
 * VPC, subnets; 
 * ECR repository with the application image;
 * ECS task and execution role;
 * Security groups.

These components can be extra modules in this or other projects, just replace the input values of the "container" module, for example:

```
vpc_id = var.vpc_id
```
by

```
vpc_id = module.networking.vpc_id
```

## Usage Instructions

* Replace the values in the `terraform.tfvars` file;
* Check if exists a workspace with the target environment with the command `terraform workspace list`;
* If it does not exist, create a new workspace for the target environment. Example for creating a "development" workspace: `terraform workspace new development`:
* Select the target workspace: `terraform workspace select development`;
* Initialize the new or existing terraform workspace: `terraform init`;
* Generates and check the speculative execution plan: `terraform plan`;
* Creates or updates infrastructure: `terraform apply`;

## Versions

| Version | Major changes |
| ------- | ------------- |
| 1     | Created module |

