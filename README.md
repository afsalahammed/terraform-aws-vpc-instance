# **Terraform AWS Infrastructure Project** 🚀

## **Overview**
This project provisions a **basic AWS infrastructure** using Terraform. It includes:
- A **VPC** with a public subnet.
- An **Internet Gateway** for external connectivity.
- A **Security Group** allowing SSH (22) and HTTP (80) access.
- An **EC2 instance** deployed in the public subnet.

## **Prerequisites**
Before running this Terraform project, ensure you have:
- An **AWS account**.
- **Terraform installed** (≥ v1.0).
- An **AWS IAM user** with necessary permissions.
- A **key pair** in AWS to access the instance.

## **Project Structure**
```
terraform-aws-infrastructure-project/
│── main.tf           # Defines AWS resources (VPC, EC2, Security Groups, etc.)
│── variables.tf      # Input variables for flexibility
│── output.tf         # Output values for reference
│── README.md         # Project documentation
```

## **Terraform Setup & Deployment**
Run the following commands to deploy the infrastructure:

1️⃣ **Initialize Terraform**
```sh
terraform init
```

2️⃣ **Preview the Changes**
```sh
terraform plan
```

3️⃣ **Apply the Configuration**
```sh
terraform apply -auto-approve
```

4️⃣ **View Outputs**
```sh
terraform output
```

5️⃣ **Destroy the Infrastructure (if needed)**
```sh
terraform destroy -auto-approve
```

## **Resources Created**
| Resource         | Description |
|-----------------|-------------|
| **VPC** | A Virtual Private Cloud (`10.0.0.0/16`) |
| **Subnet** | Public Subnet (`10.0.1.0/24`) |
| **Internet Gateway** | Enables internet access |
| **Route Table** | Routes traffic to the IGW |
| **Security Group** | Allows SSH (22) and HTTP (80) |
| **EC2 Instance** | Ubuntu 24.04, t2.micro |

## **Outputs**
After deployment, Terraform will display:
- **VPC ID**
- **Route Table ID**
- **Instance ID**
- **Public IP of EC2**

## **Security Considerations**
⚠ **Avoid exposing SSH (22) to 0.0.0.0/0**  
Instead, restrict access to your IP (`your_ip/32`).


