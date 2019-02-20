import json

from locust import HttpLocust, TaskSet, task

class Root(TaskSet):

    @task(2)
    def ingest(self):
        payload = { "message": "Hello" }
        headers = { "Content-Type": "application/json" }
        self.client.post("/ingest", data=json.dumps(payload), headers=headers)

class Locust(HttpLocust):
    task_set = Root
    min_wait = 5000
    max_wait = 9000
