provider "aws" {
  region = var.region
}

module "networking" {
  source = "./modules/networking"


  environment          = var.environment
  region               = var.region
  availability_zones   = var.availability_zones
  vpc_cidr             = var.vpc_cidr
  public_subnets_cidr  = var.public_subnets_cidr
  private_subnets_cidr = var.private_subnets_cidr
  amazon_machine_image = var.amazon_machine_image
  instance_type        = var.instance_type
  key                  = var.key

}
