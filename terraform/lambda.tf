data "aws_s3_bucket" "bucket_lambda" {
  bucket = "hibicode-lambda-bucket"
}

variable "simulacao_version" {
}

resource "aws_lambda_function" "simulacao_function" {
    function_name   = "SimulacaoFunction"

    s3_bucket       = data.aws_s3_bucket.bucket_lambda.id
    s3_key          = "v${var.simulacao_version}/simulacao.zip"

    handler         = "main.handler"
    runtime         = "nodejs12.x"

    role            = aws_iam_role.lambda_exec_role.arn

    reserved_concurrent_executions = 50
    
    vpc_config {
        subnet_ids          = module.vpc.public_subnets
        security_group_ids  = [aws_security_group.database.id, aws_security_group.allow_outbound.id]
    }

    environment {
        variables = {
            PGDATABASE  = module.rds.this_db_instance_name
            PGHOST      = module.rds.this_db_instance_address
            PGPASSWORD  = module.rds.this_db_instance_password
            PGPORT      = module.rds.this_db_instance_port
            PGUSER      = module.rds.this_db_instance_username
        }
    }
}