provider "aws" {
	region 		= "us-east-1"
	access_key 	= var.secrets["access_key"]
	secret_key 	= var.secrets["secrets_key"]
}

variable "secrets" {
	type = map
	default = {
		access_key 	= "<access_key>"
		secrets_key	= "<secrets_key>"
	}
}