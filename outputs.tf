# output "lb_dns_name" {
#   description = "The DNS name of the load balancer"
#   value       = aws_lb.nginx_alb.dns_name
# }

output "alb_dns_name" {
  description = "DNS name of the Application Load Balancer."
  value       = module.alb.alb_dns_name
}