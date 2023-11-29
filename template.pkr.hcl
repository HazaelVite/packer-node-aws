// UNIR - Herramientas DevOps
// Actividad 01
// Vite Camilo Horacio Hazael
// AWS Packer builder

packer {
  required_plugins {
    amazon = {
      version = ">= 0.0.2"
      source  = "github.com/hashicorp/amazon"
    }
  }
}

source "amazon-ebs" "packerami" {
	region = "us-east-1"
	ami_name = "pkr-consul-v1.00{{timestamp}}"
	source_ami = "ami-06aa3f7caf3a30282"
	instance_type = "t2.micro"
	subnet_id = "subnet-0f31318a1aa166f0e"
	ssh_username = "ubuntu"
	tags = {
		OS_Version = "Ubuntu Server 20.04 LTS"
		Release = "Latest"
		Base_AMI_Name = "{{ .SourceAMIName }}"
		Name = "pkr-consul-img-v0.1"
	}
}

// Build
build {
	sources = ["source.amazon-ebs.packerami"]
	
	provisioner "file" {
		source = "hello.js"
		destination = "~/hello.js"
	}

	provisioner "file" {
		source = "hazaelvite"
		destination = "~/hazaelvite"
	}

	provisioner "shell" {
		script = "./boostrap.sh"
	}
}

