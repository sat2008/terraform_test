environment = "test"
profile     = "terra"
service     = "nginx"

# optional for https ALB listener (cert arn)
alb_enable_https           = false
alb_redirect_http_to_https = false
alb_certificate_arn        = null #"arn:aws:acm:eu-west-2:myaccount:certificate/terraform_test.crt"

vpc_cidr = "10.0.0.0/16"

public_subnets = {
  public_a = {
    cidr = "10.0.0.0/24"
    az   = "eu-west-2a"
  }

  public_b = {
    cidr = "10.0.1.0/24"
    az   = "eu-west-2b"
  }
}

web_subnets = {
  web_a = {
    cidr = "10.0.2.0/24"
    az   = "eu-west-2a"
  }

  web_b = {
    cidr = "10.0.3.0/24"
    az   = "eu-west-2b"
  }
}

database_subnets = {
  database_a = {
    cidr = "10.0.4.0/24"
    az   = "eu-west-2a"
  }

  database_b = {
    cidr = "10.0.5.0/24"
    az   = "eu-west-2b"
  }
}
