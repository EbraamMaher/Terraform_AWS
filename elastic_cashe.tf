resource "aws_elasticache_cluster" "my-redis" {
  cluster_id = "my-redis"
  engine     = "redis"

  node_type            = "cache.t4g.micro"
  num_cache_nodes      = 1
  parameter_group_name = "default.redis5.0"
  engine_version       = "5.0.6"
  port                 = 6379
  apply_immediately    = true
  subnet_group_name    = aws_elasticache_subnet_group.esgroup.name
}


resource "aws_elasticache_subnet_group" "esgroup" {
  name       = "tf-test-cache-subnet-one"
  subnet_ids = [element(module.networking.private_subnets_id, 0), element(module.networking.private_subnets_id, 1)]
}