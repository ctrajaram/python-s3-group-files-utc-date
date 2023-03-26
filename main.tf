provider "aws" {
  region = "us-east-1"
  assume_role {
    //role_arn = "arn:aws:iam::114653307448:role/aws-reserved/sso.amazonaws.com/AWSReservedSSO_AdministratorAccess_75dead7430b9952e"
    session_name = "ctr"
  }

}
//
# module "vpc" {
#   source = "./vpc"
# }

module "s3" {
  source = "./s3"
  aws_projectname = "pythonlambda3-with-terraform"
  aws_region = "us-east-1"
  bucketname = "pythons3-bucket-created-terraform"
}


# module "rds" {
#   source = "./rds"
#   sbnt1 = module.vpc.privsubnetforrds1
#   sbnt2 = module.vpc.privsubnetforrds2
# }

