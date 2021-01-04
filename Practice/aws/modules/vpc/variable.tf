variable "aws_region" {
	default = "us-east-1"
}

variable "secrets" {
	type = map
	default = {
		access_key 	= "AKIA6ANKNACDPJJLNGTI"
		secrets_key	= "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"
	}
}

variable "vpc_cidr" {
	default = "192.168.0.0/16"
}

variable "vpc_id" {}

variable "subnet_cidr" {
	default = "192.168.1.0/24"
}
