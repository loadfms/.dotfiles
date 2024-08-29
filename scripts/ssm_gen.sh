#!/bin/zsh

# Set the AWS region
AWS_REGION="sa-east-1"

# Check if a file path is provided as an argument
if [ -z "$1" ]; then
    echo "Usage: $0 <file_path>"
    exit 1
fi

# Read the file line by line
while IFS='=' read -r param_name param_value; do
    # Check if the parameter already exists
    if aws ssm get-parameter --name "$param_name" --region $AWS_REGION &> /dev/null; then
        # Update the parameter if it already exists
        aws ssm put-parameter --name "$param_name" --value "$param_value" --type "SecureString" --overwrite --region $AWS_REGION > /dev/null
        echo "Parameter $param_name updated."
    else
        # Create the parameter if it doesn't exist
        aws ssm put-parameter --name "$param_name" --value "$param_value" --type "SecureString" --region $AWS_REGION > /dev/null
        echo "Parameter $param_name created."
    fi
done < "$1"
