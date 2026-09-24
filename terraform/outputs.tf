#----------------------------------------
# App URL
#----------------------------------------
output "frontend_url" {
  description = "Public URL of the app (submit this)"
  value       = "http://${aws_lb.main.dns_name}"
}

#----------------------------------------
# Values the Jenkins pipeline needs
#----------------------------------------
output "ecr_frontend_url" {
  description = "ECR repository URL for the frontend image"
  value       = aws_ecr_repository.frontend.repository_url
}

output "ecr_backend_url" {
  description = "ECR repository URL for the backend image"
  value       = aws_ecr_repository.backend.repository_url
}

output "ecs_cluster_name" {
  description = "ECS cluster name"
  value       = aws_ecs_cluster.main.name
}

output "ecs_frontend_service" {
  description = "ECS frontend service name"
  value       = aws_ecs_service.frontend.name
}

output "ecs_backend_service" {
  description = "ECS backend service name"
  value       = aws_ecs_service.backend.name
}