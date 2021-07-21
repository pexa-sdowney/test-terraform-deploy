# test-terraform-deploy


#### Run fargate to archive a youtube video:

            ```aws ecs run-task --capacity-provider-strategy capacityProvider=FARGATE,weight=1 capacityProvider=FARGATE_SPOT,weight=1 --overrides '{ "containerOverrides": [ { "name": "yt-archiver", "environment": [ { "name": "VIDEO_URL", "value": "https://www.youtube.com/watch?v=8JA9R1VdtCQ" } ] } ] }' --network-configuration '{"awsvpcConfiguration": {"subnets": ["subnet-0c2b1b6b"], "securityGroups": ["sg-00418d98ff89867f8"], "assignPublicIp": "ENABLED" } }' --task-definition yt-archiver --cluster default```
