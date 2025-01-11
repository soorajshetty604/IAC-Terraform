Types of variables
input, output and local variables<br>

each of them has type constraints like string, bool etc<br>

Terraform loads variables in the following order, with later sources taking precedence over earlier ones:

* Environment variables<br>
* The terraform.tfvars file, if present.<br>
* The terraform.tfvars.json file, if present.<br>
* Any *.auto.tfvars or *.auto.tfvars.json files, processed in lexical order of their filenames.<br>
* Any -var and -var-file options on the command line, in the order they are provided. (This includes variables set by an HCP Terraform workspace.)
