resource "aws_vpc_peering_connection" "peering" {
  count = var.is_peering_required ? 1 : 0
  peer_vpc_id   = data.aws_vpc.default.id
  vpc_id        = aws_vpc.main.id
  auto_accept = true

  tags = merge(
    var.common_tags,
    {
        Name = "${local.resource_name}-default-peering"
    }
  )
}

resource "aws_route" "public_peering" {
  count = var.is_peering_required ? 1 : 0  
  route_table_id            = aws_route.public.id
  destination_cidr_block    = data.aws_vpc.default.cidr_block
  vpc_peering_connection_id = aws_vpc_peering_connection.peering[count.index].id
}

resource "aws_route" "default_peering" {
  count = var.is_peering_required ? 1 : 0  
  route_table_id            = data.aws_vpc.default.main_route_table_id
  destination_cidr_block    = var.public_subnet_cidrs[count.index]
  vpc_peering_connection_id = aws_vpc_peering_connection.peering[count.index].id
}
