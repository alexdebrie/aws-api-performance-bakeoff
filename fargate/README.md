## Fargate API

The `deploy.sh` script in this directory will deploy a Fargate service with five instances fronted by an Application Load Balancer. The service exposes a single endpoint which accepts POST requests and forwards the payload body to SNS.

![Fargate to SNS](https://user-images.githubusercontent.com/6509926/53013070-6f1d0180-340a-11e9-860a-4f9962a04792.png)

### Usage

1. Install and configure the [AWS CLI](https://aws.amazon.com/cli/) and the [fargate CLI](http://somanymachines.com/fargate/).

2. Run the `deploy.sh` script in this repository to deploy the Fargate service.

When the deploy is complete, it will print out the command needed to run load testing with Locust.
