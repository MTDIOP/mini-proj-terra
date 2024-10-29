variable "ebs_size" {
  type        = number
  description = "set ebs size"
  default     = 5
}

variable "ebs_availability_zone" {
  type        = string
  description = "set availability zone"
  default     = "us-east-1a"
}