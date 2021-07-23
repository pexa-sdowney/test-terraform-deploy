#!/bin/bash

while read p; do
  #echo $p
  echo "Starting task for" $p
  aws ecs run-task --capacity-provider-strategy capacityProvider=FARGATE,weight=1 capacityProvider=FARGATE_SPOT,weight=1 --overrides '{ "containerOverrides": [ { "name": "yt-archiver", "environment": [ { "name": "VIDEO_URL", "value": "'"${p}"'" }, { "name": "STORAGE_CLASS", "value": "--storage-class DEEP_ARCHIVE" } ] } ] }' --network-configuration '{"awsvpcConfiguration": {"subnets": ["subnet-9be42eed"], "securityGroups": ["sg-06a605d3f406acb40"], "assignPublicIp": "ENABLED" } }' --task-definition yt-archiver --cluster default >> /dev/null 2>&1
done <videos.txt
echo "All done"