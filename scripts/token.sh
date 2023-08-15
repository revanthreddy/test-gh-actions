#!/bin/bash



function tokenize_string() {
  token_array=()
  # Get the string to tokenize
  string=$1

  # Get the delimiter
  delimiter=$2

  # Split the string on the delimiter
  tokens=$(echo $string | tr "$delimiter" '\n')

  # Add the tokens to the token_array
  for token in $tokens; do
    token_array+=($token)
  done

  # Get the size of the token_array
  size="${#token_array[@]}"

  # Print the size of the token_array
  echo "The size of the token_array is: $size"
}

# Call the function
tokenize_string "providers/aws/modules/s3" "/"
