resource "aws_iam_role_policy" "AdministratorAccess_policy" {
  name = "AdministratorAccess_policy"
  role = aws_iam_role.Test_role.id
  policy = file("module/iam/AdministratorAccess_policy.json")
}

resource "aws_iam_role" "Test_role" {
  name = "test_role"
  assume_role_policy = file("module/iam/policy.json")
}



