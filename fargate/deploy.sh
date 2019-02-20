TOPIC_ARN=$(aws sns create-topic \
  --name fargate-ingest-topic \
  --output text \
  --query 'TopicArn')

ROLE_ARN=$(aws iam create-role \
  --role-name fargate-ingest-role \
  --assume-role-policy-document '{
    "Version": "2012-10-17",
    "Statement": {
      "Effect": "Allow",
      "Principal": {"Service": "ecs-tasks.amazonaws.com"},
      "Action": "sts:AssumeRole"
    }
  }' \
  --output text \
  --query 'Role.Arn')

aws iam put-role-policy \
  --role-name fargate-ingest-role \
  --policy-name 'sns-publish' \
  --policy-document '{
    "Version": "2012-10-17",
    "Statement": {
      "Effect": "Allow",
      "Action": "sns:Publish",
      "Resource": "'$TOPIC_ARN'"
    }
  }'

fargate lb create 'flask-lb' \
  --port HTTP:80

fargate service create sns-ingest \
  --task-role $ROLE_ARN \
  --env TOPIC_ARN=$TOPIC_ARN \
  --lb flask-lb \
  --port HTTP:80 \
  --memory 8192 \
  --cpu 4096 \
  --num 50

DNS_NAME=$(fargate lb info flask-lb | grep 'DNS Name' | cut -f 3 -d " ")

echo ''
echo "Your Fargate endpoint is ready! 🎉"
echo ''
echo "Run locust load testing with the following command:"
echo ''
echo "    locust --host=http://$DNS_NAME"
