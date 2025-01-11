types of variables
input, output and local variables

each of them has type constraints like string, bool etc

Terraform loads variables in the following order, with later sources taking precedence over earlier ones:

Environment variables
The terraform.tfvars file, if present.
The terraform.tfvars.json file, if present.
Any *.auto.tfvars or *.auto.tfvars.json files, processed in lexical order of their filenames.
Any -var and -var-file options on the command line, in the order they are provided. (This includes variables set by an HCP Terraform workspace.)