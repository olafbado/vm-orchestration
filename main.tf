provider "aws" {
  region  = "us-east-2"
  profile = "olaf"
}

module "alb" {
  source                = "./modules/alb"
  name                  = "sample-app-alb"
  alb_http_port         = 80
  app_http_port         = 8080
  app_health_check_path = "/"
}

module "asg" {
  source = "./modules/asg"
  name   = "sample-app-asg"

  # fill in with your own AMI ID!
  ami_id        = "ami-01b5318850130e567"
  user_data     = filebase64("${path.module}/user-data.sh")
  app_http_port = 8080

  instance_type    = "t2.micro"
  min_size         = 1
  max_size         = 10
  desired_capacity = 3

  target_group_arns = [module.alb.target_group_arn]

  instance_refresh = {
    # rolling deployment -  add new instances, wait for health checks and then undeploy old ones
    min_healthy_percentage = 100
    max_healthy_percentage = 200
    auto_rollback          = true
  }
}
