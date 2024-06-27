
Method 1:  Initialize and Use Workspaces with Specific Backend Configuration

# Initialize and select dev workspace
terraform init -backend-config=backend-dev.tf
terraform workspace new dev
terraform workspace select dev
terraform apply

# Initialize and select qa workspace
terraform init -backend-config=backend-qa.tf
terraform workspace new qa
terraform workspace select qa
terraform apply

# Initialize and select prod workspace
terraform init -backend-config=backend-prod.tf
terraform workspace new prod
terraform workspace select prod
terraform apply


Method 2: Initialize Backend Using CLI Commands

terraform init \
  -backend-config="bucket=terraform-backend-bucket-dev" \
  -backend-config="key=terraform.tfstate" \
  -backend-config="region=ap-south-1" \
  -backend-config="dynamodb_table=terraform-locks-dev" \
  -backend-config="encrypt=true"

terraform workspace new dev
terraform workspace new qa
terraform workspace new prod


Methode 3: Switch and Apply Workspace-Specific Configuration
Switch between workspaces and apply the configuration:

# For dev workspace
terraform workspace select dev
terraform init \
  -backend-config="bucket=terraform-backend-bucket-dev" \
  -backend-config="key=terraform.tfstate" \
  -backend-config="region=ap-south-1" \
  -backend-config="dynamodb_table=terraform-locks-dev" \
  -backend-config="encrypt=true" \
  -backend-config="kms_key_id=<DEV_KMS_KEY_ARN>"
terraform apply

# For QA workspace
terraform workspace select qa
terraform init \
  -backend-config="bucket=terraform-backend-bucket-qa" \
  -backend-config="key=terraform.tfstate" \
  -backend-config="region=us-east-1" \
  -backend-config="dynamodb_table=terraform-locks-qa" \
  -backend-config="encrypt=true" \
  -backend-config="kms_key_id=<QA_KMS_KEY_ARN>"
terraform apply

# For prod workspace
terraform workspace select prod
terraform init \
  -backend-config="bucket=terraform-backend-bucket-prod" \
  -backend-config="key=terraform.tfstate" \
  -backend-config="region=us-west-1" \
  -backend-config="dynamodb_table=terraform-locks-prod" \
  -backend-config="encrypt=true" \
  -backend-config="kms_key_id=<PROD_KMS_KEY_ARN>"
terraform apply

