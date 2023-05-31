provider "aws" {
  region = "ap-south-1"
}

resource "aws_instance" "example" {
  ami           = "ami-0f5ee92e2d63afc18 "
  instance_type = "t2.micro"

  tags = {
    Name = "example-instance"
  }

  provisioner "remote-exec" {
    inline = [
      "sudo apt-get update",
      "sudo apt-get install -y nginx",
      "sudo rm /var/www/html/index.nginx-debian.html",
      "sudo bash -c 'echo \"<h1>Hello, World!</h1>\" > /var/www/html/index.html'",
      "sudo systemctl enable nginx",
      "sudo systemctl restart nginx"
    ]
  }
}

