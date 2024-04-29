import boto3
import uuid
import os

class DynamoDb:
    def __init__(self):
        self.db_client = boto3.client('dynamodb')
        self.table_name = os.environ['table_name']
    
    def write_to_db(self, resources):
        for key, value in resources.items():
            payload = {
                key : {"L": [{'S': resource_arn} for resource_arn in value]}
            }
        payload[os.environ['hash_key']] = {"S": str(uuid.uuid4())}
        self.db_client.put_item(TableName=self.table_name, Item=payload)
        