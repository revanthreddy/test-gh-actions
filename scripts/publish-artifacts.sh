#!/bin/bash

echo "Total number of modules : $#"

version_file_name="version.json"

# Get the command line arguments
module_paths=$@
# Loop over the arguments
for module_path in $module_paths; do

  # Check if the file exists in the directory

  if [ -f "$module_path/$version_file_name" ]; then
    echo "FOUND FILE"
    # Get the key to extract
    key="version"

    # Open the JSON file
    module_version_file=$(cat "$module_path/$version_file_name")
    cat module_version_file
    # Get the value for the key
    value=$(echo $module_json_file | jq ".$key")

    # Print the value
    echo "Version : $value"

  else
    # The file does not exist
    echo "The file does not exist. IGNORING $module_path"
  fi
done