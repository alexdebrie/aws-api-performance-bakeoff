import json
import os

import boto3
from flask import Flask, request
app = Flask(__name__)

sns = boto3.client('sns', region_name='us-east-1')
TOPIC_ARN=os.environ['TOPIC_ARN']


@app.route("/ingest", methods=['POST'])
def ingest():
    resp = sns.publish(
        TopicArn=TOPIC_ARN,
        Message=request.get_data(as_text=True)
    )
    return json.dumps({ "message": "ok" })

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=80)
