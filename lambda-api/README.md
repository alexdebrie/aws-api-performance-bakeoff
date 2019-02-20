## Serverless architecture with AWS Lambda

The code in this directory will deploy a Serverless application. It has a single HTTP endpoint, `/ingest` which receives POST requests and forwards the payload to an SNS topic.

![SNS Publish with Lambda](https://user-images.githubusercontent.com/6509926/52906603-cbb6cb80-3214-11e9-8a97-a5ea2d4036d3.png)

### Usage

1. Install the [Serverless Framework](www.serverless.com):

	```bash
	npm install -g serverless
	```

2. Create a service by pulling down this directory:

	```bash
	sls create --template-url https://github.com/alexdebrie/aws-api-performance-bakeoff/lambda-api
	cd lambda-api
	```
	
3. Deploy your service:

	```bash
	serverless deploy
	```
	
At the end, it will print out your endpoint which you can use for load testing with Locust.