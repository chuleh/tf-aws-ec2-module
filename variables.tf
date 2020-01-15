variable "instance_count" {
  description = "number of instances"
  type        = number
  default     = 1
}

variable "ami" {
  description = "AMI ID"
  type        = string
}

variable "instance_type" {
  description = "instance type"
  default     = "t2.micro"
}

variable "subnet_ids" {
  description = "subnets"
  type        = list(string)
  default     = []
}

variable "key_name" {
  description = "key name for the instances"
  type        = string
  default     = ""
}

variable "associate_public_ip_address" {
  description = "EC2 instance public ip address"
  type        = bool
  default     = false
}

variable "vpc_security_group_ids" {
  description = "list of SGs"
  type        = list(string)
  default     = null
}

variable "create_eip" {
  description = "associate EIP"
  type = bool
  default = false
}