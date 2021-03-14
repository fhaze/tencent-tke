# Tencent Cloud TKE - 🍱 Sandbox

[![#](https://img.shields.io/badge/Go-1.16-blue.svg)]()
[![#](https://img.shields.io/badge/Terraform-0.14.8-blueviolet.svg)]()

My Sandbox repository for Tencent Cloud Kubernetes stuff

## 🔌 Requirements
The **Go language** is required for building and running the project modules, the **Terraform** is only about providing
the cloud structure we need.

- Docker
- Docker-Compose (with support to version 3 yml files)
- Go 1.16
- Terraform 0.14+

## 🔰 Getting Started

First thing you need to do is to get you local environment ready with the dependencies I described above. Then
You need to have a Tencent Cloud account ready and create an API Key. Having that in hands just follow the next topics.

## ⚙️Let's wrap those API Keys

Just export these or set them in you bash_profile, Windows environment or whatever.

```shell
EXPORT TENCENTCLOUD_REGION=na-ashburn
EXPORT TENCENTCLOUD_SECRET_ID=your_secret_id
EXPORT TENCENTCLOUD_SECRET_KEY=your_secret_key
```

Depending on the way you set those, make sure to restart your terminal so changes can take effect. 

> 📢 **Hey!** na-ashburn is basically Virginia region for Tencent Cloud

## 🧱 Providing the TKE cluster environment

First check the Terraform files in `infrastructure/tencentcloud` for providing the TKE cluster for this project.
You can customize the cluster if you want, but rest assured because we will be providing very small machines,
so these are not going to devour your wallet.

Let's start initializing terraform for this project:

```shell
cd infrastructure/tencentcloud
terraform init
```

Basically Terraform will download the provider templates files and get ready to *plan* and *apply* the cloud structure.

We can check our plan by executing:

```shell
terraform plan
```

If you are following this guide and executing the commands you can check that terraform inform you that it is going to
create 3 resources. So what are those 3 resources?

- VPC (10.0.0.0/16)
- VPC Subnet (10.0.0.0/24)
- TKE Cluster

All right, now let's apply this plan by executing:

```shell
terraform apply
```

Terraform will show you the plan again and ask you to confirm by inputting `yes`, so just confirm that and let
Terraform provide the cloud struct for us. When Terraform returns the terminal for you, you are set!

## WIP!!