## AWS API Performance Bakeoff

This repository includes scripts for deploying an API that exposes a single endpoint. The endpoint accepts a payload via POST request and forwards the payload to an SNS topic.

### Architectures

There are three different architectures for deploying this service:

1. [Using Fargate and an Application Load Balancer](./fargate/README.md)

2. [Using the Serverless Framework and AWS Lambda](./lambda-api/README.md)

3. [Using an API Gateway service proxy integration directly to SNS](./apigw-service-proxy/README.md)

### Testing

For load testing, I used [Locust](https://locust.io/). There's a locustfile in this directory.

To use, first install Locust:
	
```bash
pip install locustio
```
	
Then, run locust with the host of your deployed API:

```bash
locust --host=<your_host>
```

Navigate to localhost:8089 to kick off your load test.