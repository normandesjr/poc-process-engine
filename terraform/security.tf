resource "aws_security_group" "database" {
  vpc_id = module.vpc.vpc_id
  name = "hibicode_database"

  ingress {
    from_port = 5432
    to_port = 5432
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    self = true
  }
}

resource "aws_security_group" "allow_outbound" {
  vpc_id = module.vpc.vpc_id
  name = "hibicode_allow_outbound"

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "allow_all" {
  vpc_id = module.vpc.vpc_id
  name = "hibicode_allow_all"

  ingress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}