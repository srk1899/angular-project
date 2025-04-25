provider "aws" {
  region = "us-east-1" # Ensure this is your correct AWS region
}

resource "aws_instance" "calculatorAngular" {
  ami           = "ami-02ef87279b0af1d2d" # Your existing Ubuntu AMI
  instance_type = "t2.micro"
  key_name      = "ktt-key" # Your actual AWS key pair

  # Attach existing security group
  vpc_security_group_ids = ["sg-003e67d8265f2683b"] # Your actual Security Group ID

  tags = {
    Name = "calculatorAngular"
  }
}

# Attach existing Elastic IP to the instance
resource "aws_eip_association" "eip_assoc" {
  instance_id   = aws_instance.calculatorAngular.id
  allocation_id = "eipalloc-0efd3a59944845481" # Replace with your actual Elastic IP allocation ID
}

