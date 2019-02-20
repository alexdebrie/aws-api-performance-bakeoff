aws iam delete-role-policy \
  --policy-name 'sns-publish' \
  --role-name fargate-ingest-role 

aws iam delete-role \
  --role-name fargate-ingest-role 

fargate service scale sns-ingest 0

fargate service destroy sns-ingest

fargate lb destroy flask-lb
