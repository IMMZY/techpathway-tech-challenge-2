#----------------------------------------
# General
#----------------------------------------
variable "aws_region" {
  description = "AWS region to deploy into"
  type        = string
  default     = "us-east-1"
}

variable "project_name" {
  description = "Prefix used for naming all resources"
  type        = string
  default     = "tc2"
}

#----------------------------------------
# Networking
#----------------------------------------
variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.20.0.0/16"
}

variable "public_subnet_cidrs" {
  description = "CIDR blocks for the two public subnets (one per AZ)"
  type        = list(string)
  default     = ["10.20.1.0/24", "10.20.2.0/24"]
}

#----------------------------------------
# Containers
#----------------------------------------
variable "frontend_port" {
  description = "Port the frontend (nginx) container listens on"
  type        = number
  default     = 80
}

variable "backend_port" {
  description = "Port the backend (Express) container listens on"
  type        = number
  default     = 8080
}

variable "image_tag" {
  description = "Docker image tag the ECS task definitions run"
  type        = string
  default     = "latest"
}

variable "task_cpu" {
  description = "CPU units per task (256 = 0.25 vCPU)"
  type        = number
  default     = 256
}

variable "task_memory" {
  description = "Memory per task in MiB"
  type        = number
  default     = 512
}

variable "desired_count" {
  description = "Number of tasks to run per service"
  type        = number
  default     = 1
}