# Using Graphs in Terraform

#### install apache and graphviz package

```bash
apt-get update -y 
apt-get install apache2 graphviz -y 
```

* Run the below command(where your main.tf/resource.tf file is present)

```bash
terraform graph > graph_output.dot
```
* convert dot file to svg

```bash
dot graph_output.dot -Tsvg -o graph_op.svg
```


