
## Using file provisioner to transfer script from local machine to remote vm


__Using file provisioner to copy frontend/sh file to remote machine__

```tf
  provisioner "file" {
     source = "./frontend"
     destination = "/home/btejas/frontend"
  }

```

__using `remote-exec` to run inline commands on remote machine__  

```tf
  provisioner "remote-exec" {
    inline = [
      "sudo chmod +x ~/frontend/run_frontend.sh",
      "sudo sh  ~/frontend/run_frontend.sh",
    ]

  }
```

__run_frontend.sh File__

```sh
#!/bin/bash

apt-get update
apt-get install apache2 -y 
systemctl start apache2 
systemctl enable apache2 

mkdir -p /var/www/html/terraform
echo "<h1> Welcome to the world of Terraform </h1>" > /var/www/html/terraform/01-Hello.html
```



* use below command to login to a vm

>  `ssh -i .terraform/.ssh/admin_rsa username@ip_address`
