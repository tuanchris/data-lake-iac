# Data lake on GCP using Terraform
Use Terraform to set up infrastructure-as-code for a Data Lake on Google Cloud Platform.
## Before we start
You will need to do the following for this project:
* Download and setup Terraform CLI: Use this getting started guide to install terraform CLI on your local machine.
* Create a Google Cloud account: Sign up for a Google Cloud account, if you haven't already. You will get $300 credit when signing up, more than enough to get you through this tutorial without spending a dollar.
* Get your billing ID: Follow the guide here to find out your billing ID on GCP. You will need it for later use.
* Install gcloud CLI: Use this link to help you install gcloud CLI locally.

## Getting started with IaC using Terraform on GCP
### Clone the project 
Clone the project locally by running: 
```
git clone https://github.com/tuanchris/data-lake-iac.git
cd data-lake-iac
```
Or you can fork the project to your account.
### Authenticate with GCP
First, authenticate with GCP. Paste the following comment to a terminal and follow the instructions.
```
gcloud auth application-default login
```
### Init project
Run the following to init our project
```
terraform init
```
### Change the parameters on Variables.tf
Change the parameters in this file. Refer back to my article and the code for what the parameter is used for.

### Create the infrastructure
Run the following to create the infrastructure
```
terraform apply
```
### Customize IAM permissions
Customize permissions in the `bq-dwh.tf`, `bq-dm.tf`, `gcs.tf`, and `iam.tf` to your specifications.
### Clean up 
Clean up the resources by running 
```
terraform destroy
```

Any feedback is welcome :) 
