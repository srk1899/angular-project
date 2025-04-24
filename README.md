Project Workflow: Deploying Angular Calculator with Terraform, Docker & GitHub Actions

Overview
This project automates the deployment of an Angular Calculator application on an AWS EC2 instance using Terraform for infrastructure provisioning, Docker for containerization, and GitHub Actions for CI/CD automation.
The workflow is structured into two jobs:

Terraform Job: Creates an EC2 instance and assigns an Elastic IP.
Deployment Job: SSHs into the EC2 instance, sets up Docker, builds the Angular application, and runs it inside a container.

Step-by-Step Breakdown

1️⃣ Job 1: Provisioning AWS Infrastructure with Terraform
📌 Purpose: Creates an AWS EC2 instance, attaches an Elastic IP, and ensures a stable infrastructure for deployment.

Key Steps:
Checkout the repository: Pulls the latest Terraform code from GitHub.
Setup Terraform: Installs and initializes Terraform.
Configure AWS Credentials: Uses GitHub secrets to authenticate AWS access.
Check AWS S3 Access: Ensures the S3 backend is reachable for Terraform state management.
Initialize Terraform: Runs terraform init to initialize the project with the backend.
Plan Terraform Execution: Runs terraform plan to preview changes before applying them.
Apply Terraform Execution: Runs terraform apply -auto-approve to create an EC2 instance and attach an Elastic IP.
Outputs the Elastic IP: The public IP of the created instance is stored for the next job.
🚀 At the end of this step, an AWS EC2 instance is up and running with an Elastic IP.


2️⃣ Job 2: Deploying the Angular Application via Docker
📌 Purpose: Sets up Docker, pulls the Angular application from GitHub, builds it into a container, and runs it on the EC2 instance.

Key Steps:
SSH into EC2: Connects to the newly created EC2 instance using the Elastic IP.
Ensure Docker is Installed: Installs Docker if it’s not already installed.
Fix Docker Permissions Issue: Runs sudo chmod 666 /var/run/docker.sock to avoid permission errors.
Remove Old Containers & Images: Stops and removes any previous deployments of the Angular Calculator.
Clone the Latest Repository: Pulls the latest version of the Angular application from GitHub.
Build the Docker Image: Runs docker build -t angular-calculator . to create a container image.
Run the Container: Runs docker run -d --name angular-calculator -p 8080:80 angular-calculator to deploy the Angular app and expose it on port 8080.
🚀 At the end of this step, the Angular Calculator is live on the EC2 instance and accessible via its Elastic IP on port 8080.
