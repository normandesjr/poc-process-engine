resource "aws_sfn_state_machine" "sfn_state_machine" {
  name     = "hibicode-state-machine"
  role_arn = aws_iam_role.iam_for_sfn.arn

  definition = <<EOF
{
  "Comment": "Simulacao",
  "StartAt": "Simulacao",
  "States": {
    "Simulacao": {
      "Type": "Task",
      "Resource": "${aws_lambda_function.simulacao_function.arn}",
      "End": true
    }
  }
}
EOF
}