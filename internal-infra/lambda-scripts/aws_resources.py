import boto3

class AwsResources:
    def __init__(self, account_id, region_name):
        self.ec2_instances = []
        self.account_id = account_id
        self.region_name = region_name
        
    
    def get_ec2_instances(self):
        try:
            ec2_client = boto3.client('ec2')
            instances = ec2_client.describe_instances()
            instance_ids = [instance['InstanceId'] for reservation in instances.get('Reservations', []) for instance in reservation.get('Instances', [])]
            instance_arns = [f'arn:aws:ec2:{self.region_name}:{self.account_id}:instance/{instance_id}' for instance_id in instance_ids]
            return instance_arns
            
        except Exception as e:
            raise Exception(f"Error getting EC2 instances: {e}")
    
    def get_all_resources(self):
        try:
            self.ec2_instances = self.get_ec2_instances()
            return {
                "ec2_instances": self.ec2_instances,
            }
        except Exception as e:
            raise Exception(f"Error getting all resources: {e}")
