import json
import os

import boto3

TOPIC_ARN = os.environ['TOPIC_ARN']
sns = boto3.client('sns')


def ingest(event, context):
    payload = event['body']

    sns.publish(
      TopicArn=TOPIC_ARN,
      Message=payload
    )

    response = {
        "statusCode": 200,
        "body": json.dumps({ "message": "ok" })
    }

    return response
