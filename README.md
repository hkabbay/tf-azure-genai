# Using Terraform to set Azure Infrastructure

This repository provides a modular design along with working examples to set up infrastructure in Azure to support the development of a Generative AI application. The modules contain information to setup Azure OpenAI accounts and LLMs, vector databases, semantic search, etc.

## Table of Contents

- [Installation](#installation)
- [Usage](#usage)
- [Contributing](#contributing)
- [License](#license)


## Installation
Clone this repository using 
```
git clone https://github.com/hkabbay/tf-azure-genai.git
cd tf-azure-genai
```

Set up required env variables

```
# sh
export ARM_CLIENT_ID="00000000-0000-0000-0000-000000000000"
export ARM_CLIENT_SECRET="12345678-0000-0000-0000-000000000000"
export ARM_TENANT_ID="10000000-0000-0000-0000-000000000000"
export ARM_SUBSCRIPTION_ID="20000000-0000-0000-0000-000000000000"
```

You can find more details on how to setup Service Principals by following the [link](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/guides/service_principal_client_secret?ajs_aid=c501810f-05d7-489b-a49a-6e2f16e1ca48&product_intent=terraform&utm_source=tf_registry&utm_content=sidebar#creating-a-service-principal-using-the-azure-cli)

## Usage

Run `terraform init` before using other Terraform commands to ensure that your working directory is properly set up and ready to manage your infrastructure.

Run `terraform plan` to review the changes that Terraform will make to your infrastructure before actually applying them. This allows you to verify that the changes align with your expectations and catch any potential issues or unintended consequences.

It's important to note that `terraform plan` does not make any changes to your infrastructure. It only shows you what changes will be made. To apply the changes and create/update the infrastructure, you need to run the `terraform apply` command.

