module "my_vpc" {
	source 		= "C:\\WORK\\Soft\\terraform_0.14.3_windows_amd64\\Practice\\AWS\\modules\\vpc"
	vpc_id 	 	= module.my_vpc.vpc_id
}

module "my_ec2" {
	source		= "C:\\WORK\\Soft\\terraform_0.14.3_windows_amd64\\Practice\\AWS\\modules\\ec2"
	ec2_subnet	= module.my_vpc.subnet_id
	ec2_sg		= module.my_vpc.security_group
}