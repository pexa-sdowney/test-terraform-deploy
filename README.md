# test-terraform-deploy


#### Run fargate to archive a youtube video:

            aws ecs run-task --capacity-provider-strategy capacityProvider=FARGATE,weight=1 capacityProvider=FARGATE_SPOT,weight=1 --overrides '{ "containerOverrides": [ { "name": "yt-archiver", "environment": [ { "name": "VIDEO_URL", "value": "https://www.youtube.com/watch?v=ycbVyjU0W7s" }, { "name": "STORAGE_CLASS", "value": "--storage-class DEEP_ARCHIVE" } ] } ] }' --network-configuration '{"awsvpcConfiguration": {"subnets": ["subnet-9be42eed"], "securityGroups": ["sg-06a605d3f406acb40"], "assignPublicIp": "ENABLED" } }' --task-definition yt-archiver --cluster default

#### Extract list of youtube urls
            youtube-dl -j --skip-download "https://www.youtube.com/user/TheOzMandias" | jq -r '.id' | sed 's_^_https://youtu.be/_' > result.log