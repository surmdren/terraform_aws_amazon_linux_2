provider "aws" {
  profile = "default"
  region  = "ap-northeast-1"
}

data "aws_ami" "Amazon_Linux_2" {
  most_recent = true

  filter {
   name = "name"
   values = ["amzn2-ami-hvm-2.0.20200520.1-x86_64-gp2"] 
}

  owners = ["137112412989"]

}

resource "aws_instance" "web" {
  ami           = "${data.aws_ami.Amazon_Linux_2.id}" 
  instance_type = "t2.micro"
}

