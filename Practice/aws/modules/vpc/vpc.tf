resource "aws_vpc" "terraform_vpc" {
	cidr_block = var.vpc_cidr
	instance_tenancy = "default"

	tags = {
		name 	= "practice-terraform-vpc"
		owner   = "alcatraz"
	}
}


resource "aws_subnet" "terraform-subnet" {
	vpc_id 		= var.vpc_id
	cidr_block  = var.subnet_cidr
	map_public_ip_on_launch = true
}


resource "aws_internet_gateway" "terraform_igw" {
	vpc_id  	= var.vpc_id

	tags = {
		Name = "Internet Gateway"
	}
}

resource "aws_route_table" "terraform_rt" {
	vpc_id   	= var.vpc_id


	route {
		cidr_block = "0.0.0.0/0"
		gateway_id = aws_internet_gateway.terraform_igw.id
	}
}


resource "aws_route_table_association" "tf_rta"  {
	subnet_id      = aws_subnet.terraform-subnet.id
	route_table_id = aws_route_table.terraform_rt.id
}


resource "aws_security_group" "tf_sg" {
	name   		= "allow_tcp"
	description = "Allow ingress tcp"
	vpc_id 		= var.vpc_id

	ingress  {
		description = "Allow on non-secure"
		from_port	= 80
		to_port		= 80
		protocol	= "tcp"
		cidr_blocks	= [var.vpc_cidr]
	}

	egress  {
		description = "Allow all egress"
		from_port	= 80
		to_port		= 80
		protocol	= "tcp"
		cidr_blocks	= ["0.0.0.0/0"]
	}
}


output "vpc_id" {
	value = aws_vpc.terraform_vpc.id
}


output "subnet_id" {
	value = aws_subnet.terraform-subnet.id
}


output "security_group" {
	value = aws_security_group.tf_sg.id
}

