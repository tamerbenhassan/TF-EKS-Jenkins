# TF-EKS-Jenkins Automation
This repository contains the necessary Terraform configuration files for creating an Amazon EKS (Elastic Kubernetes Service) cluster and automating the deployment process using Jenkins. The automation pipeline is defined in the Jenkinsfile and includes stages for initializing Terraform, formatting, validating configurations, previewing infrastructure changes, and deploying an Nginx application to the EKS cluster.

## Prerequisites
Before you begin, you will need the following:

* An AWS account with appropriate permissions to create EKS clusters and manage related resources.
* Jenkins installed with the necessary plugins to work with AWS and Terraform.
* Terraform installed on the machine running Jenkins.
* kubectl and AWS CLI configured for managing Kubernetes clusters and interacting with AWS services.

## Usage
To use this repository for EKS cluster management and application deployment, follow these steps:

* Clone the repository to your Jenkins server.
* Ensure that Jenkins has access to AWS credentials (AWS_ACCESS_KEY_ID and AWS_SECRET_ACCESS_KEY) as secret credentials. These are used by the pipeline to authenticate with AWS.
* Configure a new Jenkins pipeline job and point it to the Jenkinsfile in this repository.
* Run the pipeline through Jenkins. You can trigger it manually or configure a webhook for automatic triggering on code changes.

### Pipeline Stages
* Checkout SCM: Checks out the source code from the GitHub repository to the Jenkins workspace.
* Initializing Terraform: Runs terraform init within the EKS directory to initialize a new or existing Terraform configuration.
* Formatting Terraform: Executes terraform fmt to rewrite Terraform configuration files to a canonical format and style.
* Validating Terraform: Performs terraform validate to check whether the configuration is syntactically valid and internally consistent.
* Previewing the Infra using Terraform: Uses terraform plan to create an execution plan, showing what actions Terraform will take to change the infrastructure. Requires manual approval to proceed.
* Creating/Destroying an EKS Cluster: Applies or destroys Terraform managed infrastructure based on the action variable which should be either apply or destroy. This stage executes without manual approval after the plan is approved.
* Deploying Nginx Application: Configures kubectl to communicate with the created EKS cluster and applies Kubernetes configurations to deploy an Nginx application.
