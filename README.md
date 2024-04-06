# Case study of lightApp

this repo contains practical cloud work of deploying a microservice app, with each microservice in a different repository

- [https://github.com/baraqheart/light](main)
- https://github.com/baraqheart/lightApp
- https://github.com/baraqheart/lightApp-server

the repository contains 2 diretories, terraform and k8s-manifest, where the terraform codes contains all the terraform 
related codes for managing and maintaining the state of the infrastructure and k8s-manifests contains kubernetes
manifests files

# Azure resourse provisioning with terraform
in this project, we provisioned azure resources through terraform, managing and monitoring kubernetes clusters.
the cluster contains 2 nodes for high availability, following security best practices.


# Terraform commands
- `terraform init` : this initializes the provider in which was specified in the providers.tf file
- `terraform validate` : performs check in syntax available in the code
- `terraform plan` : performs a dry run of the desired state
- `terraform apply` : this command is used to achieve the desired state from the actual state
- `terraform fmt` : is used to perform a format to user friendly and readable formaat
- `terraform destroy` : is used to destroy created resource and perform cleanup

# resources
this is the hierarchy of files the terraform directory

![]()

### prerequisite
- Providers.tf : this file indicates as to which provider terraform will use for provisioning
- Resource group: this is like a bucket, in which hold all the resources used to complete the project,
  it is scoped to a region
- backend.tf : this is used to save the state of the infrastructure provisioned

### Networking

- virtual network: is used to isolate resources in an azure account
- subnets: are used for logical grouping of resources

### log analytics
- log analytics workspace : a workspace is like a holder that shelters log analytics solutions and other related services
- log analytics solution

### Storage 
- storage account:
- storage class:

### Monitoring
- azure monitoring: monitors the health of the cluster, and could also alert when properly configured

# How it Works
## Steps

- ***Step 1*** : Run terraform in cicd
- locate and run the `terraform/terra-cd.yml` file, this a cicd configuration using
  github actions to provision resources on azure using terraform as the iac tool.
  this code has been set to manually trigger to prevent uneccesary trigger while writing the code.
  
- ***Step 2*** : Prepare Images using cicd
- the project consists of two seperate repositories containing 2 microservices, frontend and backend
- each time there is a code change in the repos, the pipeline is triggered and cicd jobs like test, lint,
  building artifacts and images are performed
- which are then pushed to acr and finally deployed to aks.

- ***Step 3*** : MANAGINGING CLUSTERS
- kubectl is a powerful tool use to interact with kuberneted cluster
- below are commands used to carry out tasks on kubernetes 

# Azure Kubernetes Service
Azure kubernetes services is an azure managed services used to run and manage cluster, 
manages your control plane and lets you focus on building powerful microservies managing your nodes

## kubectl commands
### get commands
- `kubectl get nodes`: shows the lists of the availatble nodes in the cluster
- `kubectl get pods` : shows all the pods in the node
- `kubectl get service` :this fetches all the available services in a node
- `kubectl get ns` : gets all the namespaces available

### create commands
- `kubectl apply -f <filename>.yaml ` : this is used to create the kind of object in the file

# continous integration and deployment using github actions
this application cicd is managed through github actions with jobs to perform unit testing,
linting, building docker images and deploying to azure kuberneted service

# challenges
- major challenge was encountered with the little time
