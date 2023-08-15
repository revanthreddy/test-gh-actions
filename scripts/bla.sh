#!/bin/bash

# Input string
input_string="This is a sample input string for tokenization"

# Tokenize the input string using space as delimiter
IFS=" " read -ra tokens <<< "$input_string"

# Get the number of tokens
num_tokens=${#tokens[@]}

# Get the last element (token) from the array
last_element="${tokens[num_tokens-1]}"

# Print the last element
echo "Last element: $last_element"
