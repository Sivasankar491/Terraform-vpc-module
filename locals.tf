locals {
  resource_name = "${var.project}-${var.environment}"
  az_list = slice(data.aws_availability_zones.available.names, 0, 2)
}