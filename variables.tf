variable "ami_id" {
  type    = string
  default = "ami-053b0d53c279acc90"
}

variable "instance_type" {
  type    = string
  default = "t2.micro"
}

variable "key_pair" {
  type    = string
  default = "devops-chal.pem"
}