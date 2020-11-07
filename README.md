# terraform-task
# Clone the Repository 
git clone https://github.com/harsh-gupta-insigniac/terraform-task.git

# Update the terraform.tfvars with your credentials information

shared_credentials_file = ""
profile                 = ""

# Intialalize the terraform
terraform init

# To see the plan 
terraform plan

# Provision the resources 
terraform apply

# When you upload any .csv file lambda will automatically trigger and make an entry on dynamo DB
# Once all the testing is complete 
# Destroy the resources 

terraform destroy 