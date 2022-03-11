
* Resource group of name `greenblue` will be created 

* uses null resource
* copies frontend from other folder to current folder

```tf
resource "null_resource" "local" {
provisioner "local-exec" {
    command = <<EOT
        cp -rf /home/amit/21-Virtual-Machine-SSH/FileExec/frontend . 
        EOT
    }
```

*  now copy to remote vm

```tf
provisioner "file" { 
     source = "./frontend"
     destination = "/home/<username>/frontend"
  }
 
```
