
# Deploy Terraform Script

create AKS cluster via terraform Script


## Prerequisite Installation

Download and install terraform from https://www.terraform.io/downloads

check terraform version :

```bash
  terraform version
```
    
## Deployment

To deploy AKS via terraform script

login with your azure account
```bash
  az login
```

login with your azure account
```bash
  az login
```

After login add your azure subscription key
```bash
  az account set --subscription %subscription_key%
```

 Clone aks terraform from repository
```bash
   git clone http://ssa-bitbucket:7990/scm/ut/aks-terraform.git
```

 Open terraform and run this command
```bash
  cd terraform
  terraform init
 ``` 

The plan argument will syntax check the files and prepare the deployment
```bash
  terraform plan
 ``` 

Deploy the instance
```bash
  terraform apply
 ``` 

Connect your AKS Cluste
```bash
  az aks get-credentials --resource-group %RESOURCE_GROUP_NAME% --name %CLUSTER_NAME%
```
Check AKS connection
```bash
  kubectl get no
```


## Distroy Deployment via terraform

Destroy AKS via script

```bash
  terraform distroy
```

