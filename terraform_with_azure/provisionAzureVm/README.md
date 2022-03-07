* azurevm.tf is used to create a virtual machine in azure.

* Network configuration includes-
  * creating subnet
  * creating network interface
 

<hr>

* `vm-plan2` ->  is the final plan which can be deployed to provision resources


### steps to reproduce

* ```terraform init```

* ```terraform plan -out vm-plan2```

* ```terraform apply vm-plan2```

* Use ```terraform destroy``` to destroy the resources created.

