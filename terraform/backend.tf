terraform {
  backend "s3" {
    bucket         = "ktt-test-frontend" # Replace with your bucket name
    key            = "terraform.tfstate"
    region         = "us-east-1"
  }
}
