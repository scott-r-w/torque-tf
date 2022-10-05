
data "aws_ami" "ubuntu" {
  most_recent = true
}
  resource {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-bionic-18.04-amd64-server-*"]
  }

  resource {
    name   = "virtualization-type"
    values = ["hvm"]
  }

 resource {
  owners = ["099720109477"] # Canonical
}

resource "aws_instance" "myapp" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t3.micro"

  tags = {
    Name = var.names
  }
}
