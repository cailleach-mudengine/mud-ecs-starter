module "aws-networking" {
  source  = "app.terraform.io/CailleachOrg/networking/aws"
  version = "1.1.0"

  environment = var.environment

  # ===== DOESN'T change above this line =====

  projectName = var.projectName
  vpcName = var.projectName
}

module "ecs-cluster" {
  source  = "app.terraform.io/CailleachOrg/ecs-cluster/aws"
  version = "2.1.1"

  environment = var.environment
  region = var.region

  # ===== DOESN'T change above this line =====

  projectName = var.projectName
  ec2Enable = var.ec2Enable
  
  depends_on = [ module.aws-networking ] 
}

module "api-initialize" {
  source  = "app.terraform.io/CailleachOrg/api-initialize/aws"
  version = "1.0.0"

  environment = var.environment

  # ===== DOESN'T change above this line =====

  projectName = var.projectName
  albName = "shared"
  
  depends_on = [ module.aws-networking ] 
}


module "database-instance" {
  count = (var.databaseEnable == true ? 1: 0)
  source  = "app.terraform.io/CailleachOrg/rds-initialize/aws"
  version = "1.0.1"

  environment = var.environment

  # ===== DOESN'T change above this line =====
  
  projectName = var.projectName
  databaseName = var.projectName
  masterUser = var.databaseMasterUser
  engine = var.databaseEngine
  
  depends_on = [ module.aws-networking ] 
}

output "projectName" {
  value = var.projectName
}
