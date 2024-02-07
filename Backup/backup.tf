resource "aws_backup_vault" "test_backupvalt" {
  name = "test_backupvalt"
  tags = {
    env = "practic"
  }
}
resource "aws_backup_plan" "test_backupplan" {
  name = "test_backupplan"
  rule {
    rule_name = "test-backupplanrule"
    target_vault_name = aws_backup_vault.test_backupvalt.name
    schedule = "cron(0 9 ? * MON-FRI *)"

    lifecycle {
      delete_after = 14
    }
  }
  advanced_backup_setting {
    backup_options = {
      WindowsVSS = "enabled"
    }
    resource_type = "EC2"
  }
  tags = {
    env = "practic"
    windowsvss = "enables"
  }
}
/*resource "aws_backup_selection" "test_backupselection" {
  name = "test_backupselection"
  iam_role_arn = aws_iam_role.default.arn
  plan_id = aws_backup_plan.test_backupplan.id
  selection_tag {
    type = "env"
    key = "practic"
    value = "practic"
  }
}*/