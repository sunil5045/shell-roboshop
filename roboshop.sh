#!bin/bash

#variables
SG_ID="sg-028ddb0e8c0c3c494"
AMI_ID="ami-0220d79f3f480ecf5"

for instance in $@
do
    aws ec2 run-instances \
    --image-id $AMI_ID \
    --instance-type "t3.micro" \
    --security-group-ids $SG_ID \
    --tag-specifications "ResourceType=instance,Tags=[{Key=Name,Value=$instance}]" \
    --query 'Instances[0].InstanceId' \
    --output text
done
