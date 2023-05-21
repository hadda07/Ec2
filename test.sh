#!/bin/bash

# Set variables for EC2 instance creation
AMI_ID="$1"  # Amazon Linux 2 AMI ID
INSTANCE_TYPE="$2"  # Instance type
KEY_NAME="$3"  # Name of existing EC2 key pair
SECURITY_GROUP_NAME="$4"  # Name of existing security group
AWS_REGION="$5"  # AWS region
#AWS_ACCOUNT_ID="123456789012"  # AWS account ID

# Create EC2 instance
INSTANCE_ID=$(aws ec2 run-instances --image-id "$AMI_ID" --instance-type "$INSTANCE_TYPE" --key-name "$KEY_NAME" --security-groups "$SECURITY_GROUP_NAME" --region "$AWS_REGION" --count 1 --query 'Instances[0].InstanceId' --output text)

# Output instance ID
echo "Instance created with ID: $INSTANCE_ID"
