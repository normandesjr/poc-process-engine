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