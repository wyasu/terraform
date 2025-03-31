module "vpc" {
  source = "../../modules/vpc"
}

module "ec2" {
  source = "../../modules/ec2"
  allow_ssh = true
  subnet_id = module.vpc.public_subnet_ids[0]
}