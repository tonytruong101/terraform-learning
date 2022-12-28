resource "aws_iam_user" "iam_user" {
  name = var.user_name
  path = var.path

  tags = var.tags
}

resource "aws_iam_access_key" "iam_user" {
  user = aws_iam_user.iam_user.name
}

output "access_key_id" {
  value = aws_iam_access_key.iam_user.id
}

output "secret_access_key" {
  value = aws_iam_access_key.iam_user.secret
}
