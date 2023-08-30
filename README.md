# Welcome to template-launchdarkly 🚀
Your one-stop Terraform template for all things LaunchDarkly! Simplify your project management, environment setup, and feature flag toggling with this pre-configured template.

### 🎉 What's Inside?
This template comes packed with several Terraform configuration files each with a specific purpose:


📂 Folder Structure
```
template-launchdarkly/
├── backend.tf
├── providers.tf
├── variables.tf
├── locals.tf
├── outputs.tf
├── project.tf
└── ff-enable-hello-world.tf
```

📄 [**backend.tf**](./backend.tf): Configure the backend storage for Terraform's state files.

📄 [**providers.tf**](./providers.tf): Set up the providers Terraform will use for resource provisioning.

📄 [**variables.tf**](./variables.tf): Define input variables for your Terraform configurations.

📄 [**locals.tf**](./locals.tf): Create local variables for value transformation or combination.

📄 [**outputs.tf**](./outputs.tf): Specify the outputs resulting from your Terraform execution.

📄 [**project.tf**](./project.tf): Contains core resource definitions for your LaunchDarkly project.

📄 [**ff-enable-hello-world.tf**](./ff-enable-hello-world.tf): An example Terraform configuration for a LaunchDarkly feature flag.

### 🚀 GitHub Actions
[terraform_deploy.yml](./.github/workflows/terraform-deploy.yml) automates Terraform deployment. It gets triggered by push events to the main branch and leverages environment variables to pass sensitive and project-specific information to Terraform.

### 🔐 Prerequisites
Make sure to add your LaunchDarkly access token to your GitHub Secrets. Name the secret `LD_ACCESS_TOKEN`. This token will populate the `TF_VAR_access_token` environment variable in the GitHub Actions workflow.

### 📚 Terraform Backend Configuration
Terraform utilizes persistent state data to manage resources effectively. In more advanced configurations, this involves using a backend like Terraform Cloud or Amazon S3. For more details, check the [official backend configuration documentation](https://developer.hashicorp.com/terraform/language/settings/backends/configuration).

In this template, the [**backend.tf**](./backend.tf) file uses Amazon S3 to store Terraform state data:

- **bucket:** Specifies the S3 bucket for storing the Terraform state. Replace [YOUR_BUCKET_NAME] with your actual bucket name.
- **region:** Indicates the AWS region of your S3 bucket. Use your preferred region like us-west-2 or us-east-1.
- **key:** Sets the state file's name within the S3 bucket; defaults to terraform.tfstate.
- **encrypt:** Enables encryption for your stored state file for added security.


---

Happy toggling! 🥳