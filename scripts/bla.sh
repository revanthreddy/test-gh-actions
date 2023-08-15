#!/bin/bash

construct_artifact_path_and_get_module() {
    local input_string="$1"
    IFS="/" read -ra tokens <<< "$input_string"
    local num_tokens=${#tokens[@]}

    local provider_name="${tokens[1]}"
    local module_name="${tokens[num_tokens-1]}"

    local values=("providers/$provider_name/modules/$module_name" "$module_name")
    echo "${values[@]}"
}

# Input string
input_string="providers/aws/modules/s3"

# Call the function and print the result
result_array=($(construct_artifact_path_and_get_module "$input_string"))

# Access the values from the array
artifact_path="${result_array[0]}"
module_name="${result_array[1]}"

echo $artifact_path
echo $module_name