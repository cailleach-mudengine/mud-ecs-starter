variable "projectName" {}

variable "environment" {}

variable "ec2Enable" {
  default = "false"
}

variable "databaseEnable" {
  default = "false"
}

variable "databaseEngine" {
  default = "postgres"
}

variable "databaseMasterUser" {
  default = "master"
}