resource "aws_ecs_task_definition" "yt_archiver" {
  family                   = "yt-archiver"
  task_role_arn            = "arn:aws:iam::${data.aws_caller_identity.current.account_id}:role/ecsTaskExecutionRole"
  execution_role_arn       = "arn:aws:iam::${data.aws_caller_identity.current.account_id}:role/ecsTaskExecutionRole"
  network_mode             = "awsvpc"
  cpu                      = "256"
  memory                   = "512"
  requires_compatibilities = ["FARGATE"]

  container_definitions = <<EOF
  [
    {
      "image": "public.ecr.aws/g4k5i3z6/yt-archiver",
      "name": "yt-archiver"
    }
  ]
  EOF
}

data "aws_caller_identity" "current" {}