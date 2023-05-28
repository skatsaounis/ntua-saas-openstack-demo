# 6 - Virtual Machine setup with Terraform

Install Terraform: <https://developer.hashicorp.com/terraform/downloads>

## Terraform provisioning

```bash
export OS_USERNAME='dslab-xx'
export OS_PASSWORD='my-password'

cd terraform
terraform init
terraform plan
terraform apply -auto-approve
```

## Validation

VM is put in `Running` state.

![running-vm](images/running-vm.png)
