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
      "name": "yt-archiver",
      "logConfiguration": {
          "logDriver": "awslogs",
          "options": {
              "awslogs-group": "fargate",
              "awslogs-region": "ap-southeast-2",
              "awslogs-stream-prefix": "ecs-fargate-yt-archiver",
              "awslogs-create-group": "true"
                }
    }
    }
  ]
  EOF
}

data "aws_caller_identity" "current" {}