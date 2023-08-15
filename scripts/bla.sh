#!/bin/bash

get_last_element() {
    local input_string="$1"
    IFS=" " read -ra tokens <<< "$input_string"
    local num_tokens=${#tokens[@]}
    local last_element="${tokens[num_tokens-1]}"
    echo "$last_element"
}

# Input string
input_string="This is a sample input string for tokenization"

# Call the function and print the result
last_element=$(get_last_element "$input_string")
echo "Last element: $last_element"