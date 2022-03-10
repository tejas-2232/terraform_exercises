locals {
  default = timestamp()
}

locals { 
 time = formatdate("DD MMM YYYY hh:mm ZZZ", timestamp()) 
}

locals { 
 example = formatdate("DD MMM YYYY hh:mm ZZZ", "2018-01-02T23:12:01Z")
}

output "default_time" {
  value = local.default
}

output "frmtime" { 
 value = local.time
}


output "fmtexample" { 
 value = local.example
}
