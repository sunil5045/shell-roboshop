#!/bin/bash

# Variables
AMI_ID="ami-0220d79f3f480ecf5"     # Replace with valid AMI ID
INSTANCE_TYPE="t3.micro"
KEY_NAME="sunildell"
SECURITY_GROUP="sg-028ddb0e8c0c3c494" # Replace with valide Security group id
SUBNET_ID="subnet-00cf3e53c22c09060"

# Create EC2 instance
aws ec2 run-instances \
  --image-id $AMI_ID \
  --count 1 \
  --instance-type $INSTANCE_TYPE \
  --key-name $KEY_NAME \
  --security-group-ids $SECURITY_GROUP \
  --subnet-id $SUBNET_ID \
  --tag-specifications 'ResourceType=instance,Tags=[{Key=Name,Value=MyInstance}]'

echo "EC2 instance creation triggered!"
echo "Public IP   : $PUBLIC_IP"
echo "Private IP  : $PRIVATE_IP"