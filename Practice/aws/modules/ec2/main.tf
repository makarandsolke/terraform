data "aws_ami" "tf_ami" {
  owners      = [<owner_account>]
  most_recent = true  
  
  filter {
    name   = "tag:name"
    values = ["my-image"]
  }  
}


resource "aws_instance" "web" {
	ami 			= data.aws_ami.tf_ami.id
	instance_type 	= "t2.micro"
	key_name		= aws_key_pair.tf_key_pair.id
	security_groups	= [var.ec2_sg]
	subnet_id		= var.ec2_subnet
	associate_public_ip_address = true
	user_data		= "<script_path>"
}


resource "aws_key_pair" "tf_key_pair" {
	
	key_name	= "aws-practice-key"
	public_key	= "<public_key>"
}

output "aws_ami_id" {
	value = data.aws_ami.tf_ami.id
}