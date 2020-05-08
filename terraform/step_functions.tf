resource "aws_sfn_state_machine" "sfn_state_machine" {
  name     = "hibicode-state-machine"
  role_arn = aws_iam_role.iam_for_sfn.arn

  definition = <<EOF
{
  "Comment": "Simulacao",
  "StartAt": "Simulacao",
  "States": {
    "Is Single Stallment": {
        "Type" : "Choice",
        "Choices": [ 
          {
            "Variable": "$.quantity",
            "NumericEquals": 1,
            "Next": "Disbursment"
          },
          {
            "Variable": "$.quantity",
            "NumericGreaterThan": 1,
            "Next": "Manager Manual Approve"
          }
      ]
    },
    "Disbursment": {
      "Type": "Pass",
      "End": true
    },
    "Manager Manual Approve": {
      "Type": "Pass",
      "End": true
    }
  }
}
EOF
}