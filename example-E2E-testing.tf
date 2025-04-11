EXAMPLE END-TO-END TEST USING TF TEST FRAMEWORK
WOULD ALSO NEED THIRD VARIABLES.TF FILE

#in terraform you leverage apply command
#below is basic test

# example file is main.tf
-------------------------
variable "repo_name" {
  type = string
  default     = null
}

resource "aws_codecommit_repository" "codecommit" {
  repository_name = var.repo_name #👈 the repo name has been assigned as a variable here
}

# then test below to validate functionality
# 1 - will run terraform apply to create resources
# 2 - check the resources based on your assertions
# 3 - then run terraform destroy to remove the test resources and clean up

# example file is example.tftest.hcl 👈 runs terraform apply in a temp test workspace, does assertions, then runs terraform destory automatically
# runs in a sandbox test workspace
------------------------------------
variables {
  repo_name = "MyRepo"
}

run "e2e-test"{
  command = apply

  assert {
    condition     = aws_codecommit_repository.codecommit.repository_name == "MyRepo" # 👈 here is where it's checking the repo name matches expected value
    error_message = "The CodeCommit Repo name didn't match the expected value."
  }
}

# in the above terraform apply and terraform destroy would be ran to test full functionality
# once code commit repo is created ...
# assertion will do a check based on the condition
# if true, test will pass, if fals test will fail and error message will be thrown

# would be using the above with terraform test

USE A SEPARATE TEST AWS ACCOUNT OR REGION SO TEST INFRA CAN'T COLLIDE WITH REAL INFRA
USE FAKE NAMES IN TESTS, NEVER USE REAL PROD INPUTS IN TESTS
DOUBLE CHECK VARIABLES IN TEST FILE AND MAKE SURE YOU'RE PASSING SAFE, ISOLATED VALUES

FOR EXAMPLE
if test file has a variable like
variables {
  repo_name = "prod-shared-codecommit"
}

and you try to test it, but there is an actual repo with that name already
terraform apply tries to create it and would fail or overwrite it
then terraform destroy will delete the real production repo
you'd accidentally blow up prod by running a test
