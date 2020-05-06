resource "aws_kms_key" "kms" {
  description = "example"
}

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

  encryption_info {
    encryption_at_rest_kms_key_arn = aws_kms_key.kms.arn
    
    encryption_in_transit {
      client_broker = "TLS_PLAINTEXT"
      in_cluster    = true
    }
  }

  open_monitoring {
    prometheus {
      jmx_exporter {
        enabled_in_broker = false
      }

      node_exporter {
        enabled_in_broker = false
      }
    }
  }
}

output "bootstrap_brokers" {
  description = "Plaintext connection host:port pairs"
  value       = aws_msk_cluster.msk.bootstrap_brokers
}
