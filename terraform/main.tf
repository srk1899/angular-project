provider "aws" {
  region = "us-east-1" # Ensure this is your correct AWS region
}

resource "aws_instance" "calculatorAngular" {
  ami           = "ami-04b4f1a9cf54c11d0" # Your existing Ubuntu AMI
  instance_type = "t2.micro"
  key_name      = "kp001" # Your actual AWS key pair

  # Attach existing security group
  vpc_security_group_ids = ["sg-0b6450d582b178cc2"] # Your actual Security Group ID

  tags = {
    Name = "calculatorAngular"
  }
}

# Attach existing Elastic IP to the instance
resource "aws_eip_association" "eip_assoc" {
  instance_id   = aws_instance.calculatorAngular.id
  allocation_id = "eipalloc-0f603ac2ec5663b67" # Replace with your actual Elastic IP allocation ID
}

