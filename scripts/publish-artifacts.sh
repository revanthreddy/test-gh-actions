#!/bin/bash

echo "Total arguments : $#"
# Get the arguments from the command line
args=$@

# Loop over the arguments
for arg in $args; do
  # Print the argument
  echo $arg
done