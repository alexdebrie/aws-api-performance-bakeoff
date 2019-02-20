aws cloudformation deploy \
  --stack-name service-proxy \
  --template-file template.yml \
  --capabilities CAPABILITY_IAM

HOST=$(aws cloudformation describe-stacks \
  --stack-name service-proxy \
  --output text \
  --query 'Stacks[0].Outputs[?OutputKey==`ServiceEndpoint`].OutputValue')

echo ''
echo "Your service proxy endpoint is ready! 🎉"
echo ''
echo "Run locust load testing with the following command:"
echo ''
echo "    locust --host=$HOST"
