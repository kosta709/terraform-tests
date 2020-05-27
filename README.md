## Terraform example

#### How to check for non-terraform changes
https://www.terraform.io/docs/internals/json-format.html#change-representation

```
terraform plan -out tfplan-1
terraform show -json tfplan-1 | jq . > changes.json
 cat changes.json | jq '.resource_changes | map ( select(any(.change.actions[]; . != "no-op" ))| .address + ": " + (.change.actions | join(",")))'
```
