Change terraform remote state:
0. terraform state pull -> unauthorized
1. Get token (account settings) Terraform
2. export TF_TOKEN_app_terrafo = <token>
3. terraform state list - search needed resource
4. terraform state show FULL_RESOURCE_PATH -> get actual UUID (for example)
5. terraform state pull > terraform.tfstate
6. CHAGE UUID, CHNAGE SERIAL in terraform.tfstate file # change uuid if necessary or something else
7. terraform show terraform.tfstate # check
8. terraform state push terraform.tfstate # DANGEROUS



# rm from state
terraform state rm FULL_RESOURCE_PATH


# rm from state and infra
terraform destroy -target=FULL_RESOURCE_PATH

terraform state replace-provider `
>>   -auto-approve `
>>   registry.terraform.io/hashicorp/terraform `
>>   terraform.io/builtin/terraform