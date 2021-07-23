resource "aws_ecs_task_definition" "yt_archiver" {
  family                   = "yt-archiver"
  task_role_arn            = "arn:aws:iam::${data.aws_caller_identity.current.account_id}:role/ecsTaskExecutionRole"
  execution_role_arn       = "arn:aws:iam::${data.aws_caller_identity.current.account_id}:role/ecsTaskExecutionRole"
  network_mode             = "awsvpc"
  cpu                      = "256"
  memory                   = "512"
  requires_compatibilities = ["FARGATE"]

  volume {
    name = "efs"

    efs_volume_configuration {
      file_system_id = "fs-88181eb0"
      #root_directory = "/downloads"
      # transit_encryption      = "ENABLED"
      # transit_encryption_port = 2999
      # authorization_config {
      #   access_point_id = aws_efs_access_point.test.id
      #   iam             = "ENABLED"
      # }
    }
  }
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
    },
    "mountPoints": [
                {
                    "sourceVolume": "efs",
                    "containerPath": "/"
                }
            ]
    }
  ]
  EOF
}

# resource "aws_efs_file_system" "foo" {
#   creation_token = "my-product"

#   tags = {
#     Name = "MyProduct"
#   }
# }

data "aws_caller_identity" "current" {}