#!/bin/bash

function tokenize_string() {
  # Get the string to tokenize
  token_array=()
  string=$1

  # Get the delimiter
  delimiter=$2

  # Split the string on the delimiter
  tokens=$(echo $string | tr "$delimiter" '\n')

  for token in $tokens; do
    token_array+=($token)
  done

  # Get the first token
  first_token=${token_array[0]}

  size="${#token_array[@]}"

  # Get the last token
  last_token=${token_array[$size-1]}

  # Print the first and the last token
  echo "The first token is: $first_token"
  echo "The last token is: $last_token"
#  provider_index=1
#  module_name_index=-1
##  echo "${tokens[provider_index]}"
##  echo "${tokens[module_name_index]}"
#
#  last_token=${tokens[-1]}

  # Return the last token
#  echo "$tokens"

}

# Call the function
tokenize_string "providers/aws/modules/s3" "/"
