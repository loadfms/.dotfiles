#!/bin/zsh

# Set the AWS region
AWS_REGION="sa-east-1"

# Verifica se o argumento foi passado
if [ -z "$1" ]; then
    echo "Please provide the search term. Example: ./get_ssm.sh horcrux"
    exit 1
fi

# Termo a ser pesquisado
search_term="$1"

# Function to retrieve parameters recursively
retrieve_all_parameters() {
    aws ssm describe-parameters --output json --max-items 50 --starting-token "$1" --region $AWS_REGION
}

extract_next_token() {
    echo "$1" | jq -r '.NextToken'
}

extract_data() {
    echo "$1" | jq -r '.Parameters'
}

if [ ! -f "result.json" ]; then
    # Initial call to retrieve parameters
    temp_result=$(retrieve_all_parameters "")
    data=$(extract_data "$temp_result")
    nextToken=$(extract_next_token "$temp_result")

    page=0

    echo "$data" >> result.json
    echo "page $page"

    # Function to handle pagination and retrieve all parameters
    while [ "$nextToken" != "null" ]; do
        ((page++))
        temp_result=$(retrieve_all_parameters $nextToken)
        data=$(extract_data "$temp_result")
        nextToken=$(extract_next_token "$temp_result")

        echo "$data" >> result.json
        echo "page $page"
    done
else
    echo "result.json found. skipping ssm listing"
fi

#names_with_search_term=$(jq -r '.[] | select(.Name | contains("horcrux")) | .Name' result.json)
names_with_search_term=$(jq -r --arg search_term "$search_term" '.[] | select(.Name | contains($search_term // "")) | .Name' result.json)

while IFS= read -r parameter; do
    echo "getting $parameter"
    value=$(aws ssm get-parameter --name "$parameter" --query 'Parameter.Value' --output text --with-decryption --region sa-east-1)
    echo "$parameter=$value" >> final.txt
done <<< "$names_with_search_term"

echo "Parameters name and values saved on final.txt"
