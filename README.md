# AWS Starter

After refactoring the service repository is no longer standalone (regarding stack).
It needs another project (this one) to create all shared structures.

Think of this project as being service's father.  (And bootstrap being service's grampa).

In this starter we will create:
- a networking structure comprising a VPC for the project (main VPC is not touched nor deleted);
- public and private subnets (two of each kind only at this moment);
- ECS cluster (you can choose EC2 or Fargate capacity provider);
- public API Gateway with a hello route (for troubleshooting purposes);
- optionally a RDS instance;

Target Audience: devops team.
This project can be used after bootstrap has create basic configuration for the
project in this environment.  This ecs-starter create all shared resources regarding an ECS cluster solution.

There's no actions triggered by development team at this moment.


## Structure

A project create with this template will have:

- a Terraform script;
- a commented configuration file;

The terraform script will contain calls for each terraform modules used to create the resources:

- network structure (terraform-aws-networking);
- ecs cluster (terraform-aws-ecs-cluster);
- rds instance (terraform-aws-rds-initialize);
- public API Gateway (terraform-aws-api-initialize);



In the configuration file you can customize details about ECS cluster creation
and opt-in for a shared database instance.  (You aren't required to create a RDS instance
at this moment, that's just for a shared instance).


## Create Repository Pipeline

When the repository is created a pipeline is triggered to create a TFC workspace.
The workspace will have the repository name and the environment as suffix.

The workspace need to be created at an specific terraform project, in order to inherit
all variables written by bootstrap script.

There's no run or apply operations at this point.  Just workspace creation.


## Pull Request Pipeline

The main reason to have a commented configuration file is to give to user the opportunity
to customize this file.
This customization is made through a branch creation and a pull request.

Then creating the pull request a `terraform plan` command is issued against Terraform Cloud
and the plan results displayed in pull request as comment.


## Push Main Pipeline

Any push performed in main branch will trigger the publish pipeline.
This time a `terraform apply` is issued and all stack is created/updated.
As workspaces are created with autoApply flag turned on there's no need of
human intervention at this point.

The workspace run results can be checked through Git Actions pane or directly in
Terrraform Cloud
