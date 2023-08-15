#!/bin/bash

# Get the string to tokenize
string="providers/aws/modules/s3"

# Split the string on the "/" delimiter
tokens=$(echo $string | tr '/' '\n')

# Print the tokens
for token in $tokens; do
  echo $token
done
