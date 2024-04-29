from aws_resources import AwsResources
import boto3
from pprint import pprint
from tags_finder import TagsFinder
from db import DynamoDb

tags_to_find = ["Owner", "Project", "Environment"]

def lambda_handler(event, context):
    try:
        account_id = boto3.client('sts').get_caller_identity().get('Account')
        region_name = boto3.session.Session().region_name
        aws_resources = AwsResources(region_name=region_name, account_id=account_id)
        all_resources = aws_resources.get_all_resources()
        tag_finder = TagsFinder(tags_to_find=tags_to_find, resources=all_resources)
        untagged_resources = tag_finder.get_untagged_resources()
        db = DynamoDb()
        db.write_to_db(untagged_resources)
        print(untagged_resources)
        return {
            'statusCode': 200,
            'body': 'Hello from Lambda!'
        }
    except Exception as e:
        print(f"An error occurred in the Lambda handler: {str(e)}")
        return {
            'statusCode': 500,
            'body': 'Internal Server Error'
        }
