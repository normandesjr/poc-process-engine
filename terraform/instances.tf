resource "aws_key_pair" "keypair" {
  public_key = file("key/zup_key.pub")
}

resource "aws_instance" "instance" {
  ami = "ami-0fc61db8544a617ed"
  instance_type = "t2.micro"

  subnet_id = module.vpc.public_subnets[0]

  key_name = aws_key_pair.keypair.key_name

  vpc_security_group_ids = [aws_security_group.allow_all.id, aws_security_group.allow_outbound.id]

#   user_data = templatefile("${path.module}/user_data/install_app.tmpl", {database_endpoint = module.rds.this_db_instance_endpoint})
    
  tags = {
    Name = "hibicode_instances"
  }
}

output "public_ips" {
  value = aws_instance.instance.public_ip
}
