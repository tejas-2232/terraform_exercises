
# Using modules in Terraform


__We are using 2 modules here__

1. network => `to create Resource group, Vnet, Subnet ,virtual interface, public ip, n/w security group, n/w security rules.`

* network:
  * network.tf
  * output.tf
  * provider.tf
  * variable.tf

2. compute => `to create a virtual machine `

* compute:
  * main.tf
  * provider.tf
  * variable.tf

<hr>

Let's explore each file one by one




__To explore more-Checkout [Documentation](https://www.terraform.io/language/modules)__
