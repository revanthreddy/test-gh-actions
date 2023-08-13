#!/bin/bash

echo "Total number of modules : $#"

version_file_name="version.json"

# Define the function to tokenize a string
function tokenize_string() {
  # Get the string to tokenize
  string="$1"

  # Get the delimiter
  delimiter="$2"

  # Split the string on the delimiter
  tokens=$(echo $string | tr $delimiter "\n")

  # Return the tokens
  return $tokens
}

# Get the command line arguments
args=$@

# Loop over the arguments
for arg in $args; do
  # Tokenize the argument
  # Check if the file exists in the directory
  if [ -f "$arg/$version_file_name" ]; then
    # The file exists
    echo "VERSION file present in $arg"
  else
    # The file does not exist
    echo "The file does not exist."
  fi
  tokens=$(tokenize_string $arg "/")

  # Print the tokens
  echo $tokens
done