import boto3

class TagsFinder:
    def __init__(self, tags_to_find, resources):
        self.client = boto3.client("resourcegroupstaggingapi")
        self.tags_to_find = set(tags_to_find)  # Convert to set for faster membership check
        self.resources = resources
        self.untagged_instances = []
    
    def get_tagless_ec2_instances(self):
        try:
            response = self.client.get_resources(ResourceTypeFilters=["ec2:instance"])
            instances_without_tags = []
            for instance in response.get("ResourceTagMappingList", []):
                print("Checking tags for instance:", instance["ResourceARN"])
                if instance["ResourceARN"] not in self.resources.get("ec2_instances", []):
                    instances_without_tags.append(instance["ResourceARN"])
                else:
                    instance_tags = {tag["Key"] for tag in instance.get("Tags", [])}
                    if not self.tags_to_find.issubset(instance_tags):
                        instances_without_tags.append(instance["ResourceARN"])
            return instances_without_tags
        except Exception as e:
            raise Exception(f"Error getting EC2 instances tags: {e}")
    
    def get_untagged_resources(self):
        try:
            self.untagged_instances = self.get_tagless_ec2_instances()
            return {
                "ec2_instances": self.untagged_instances
            }
        except Exception as e:
            raise Exception(f"Error getting untagged resources: {e}")
        