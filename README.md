## Terraform example

#### How to check for non-terraform changes

```
terraform plan -out tplan-1
terraform show -json tfplan-1 | jq . > changes.json
 cat changes.json | jq '.resource_changes | map ( select(any(.change.actions[]; . != "no-op" ))| .address)'
```