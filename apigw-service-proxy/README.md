## API Gateway Service Proxy

The CloudFormation template in this directory will configure an API Gateway REST API with a single endpoint. The endpoint will accept POST requests and forward the payload body to SNS.

![APIG Service Proxy](https://user-images.githubusercontent.com/6509926/53012281-249a8580-3408-11e9-91e6-c64cfc82a434.png)

For more information, check out this post for a [full walkthrough on an API Gateway service proxy](https://www.alexdebrie.com/posts/aws-api-gateway-service-proxy/).

### Usage

1. Install and configure the [AWS CLI](https://aws.amazon.com/cli/).

2. Run the `deploy.sh` script in this repository to deploy the CloudFormation template.

When the deploy is complete, it will print out the command needed to run load testing with Locust.