## command to plan a single resource group

> terraform plan -target="azurerm_resource_group.expample_rg_red" 

* This will update only the example_rg_red resource group.


__Steps for creating a build-plan__


* plan the build-plan 
```
terraform plan -out build-plan
```

* To see the build-plan
```
# terraform show build-plan
```

* apply the build-plan

```
terraform apply build-plan
```

* to destroy the build-plan
  * this will work only if statefile is present


```
terraform plan -destroy -out destroy-plan 
```

* Now use the below command to destroy resources using the destory-plan we created
  
```
terraform apply destory-plan
```

