#!/bin/bash

array=()

function tokenize_string() {
  # Get the string to tokenize
  string=$1

  # Get the delimiter
  delimiter=$2

  # Split the string on the delimiter
  tokens=$(echo $string | tr "$delimiter" '\n')

  # Add the tokens to the array
  for token in $tokens; do
    array+=($token)
  done

  # Get the size of the array
  size=${#array[@]}

  # Print the size of the array
  echo "The size of the array is: $size"
}

# Call the function
tokenize_string "providers/aws/modules/s3" "/"
