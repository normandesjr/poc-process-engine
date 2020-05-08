resource "aws_sfn_state_machine" "sfn_state_machine" {
  name     = "hibicode-state-machine"
  role_arn = aws_iam_role.iam_for_sfn.arn

  definition = <<EOF
{
  "Comment": "Financial",
  "StartAt": "Is Single Stallment",
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
            "Next": "Risk Analysis"
          }
      ]
    },
     "Risk Analysis": {
      "Type": "Task",
      "Resource": "${aws_lambda_function.avalia_risco_function.arn}",
      "Next": "Is Risk Approved"
    },
    "Is Risk Approved": {
        "Type" : "Choice",
        "Choices": [ 
          {
            "Variable": "$.approved",
            "BooleanEquals": true,
            "Next": "Disbursment"
          },
          {
            "Variable": "$.approved",
            "BooleanEquals": false,
            "Next": "Credit Denied"
          }
      ]
    },
    "Disbursment": {
      "Type": "Pass",
      "End": true
    },
    "Credit Denied": {
      "Type": "Pass",
      "End": true
    }
  }
}
EOF
}