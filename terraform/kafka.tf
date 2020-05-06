resource "aws_msk_cluster" "msk" {
  cluster_name           = "hibicode"
  kafka_version          = "2.4.1"
  number_of_broker_nodes = 3

  broker_node_group_info {
    instance_type  = "kafka.t3.small"
    ebs_volume_size = 1
    client_subnets = module.vpc.public_subnets
    security_groups = [ aws_security_group.allow_all.id ]
  }
}
