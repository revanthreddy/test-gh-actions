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
    echo "$DAY_OF_WEEK"

    # Open the JSON file
    module_version_file=$(cat "$module_path/$version_file_name")
    # Get the value for the key
    value=$(echo "$module_version_file" | jq ".$key")

    if [ -z "$value" ]; then
      echo "The key $key does not exist in the JSON file $version_file_name."
      continue
    fi
    # PUBLISH TO JFROG CODE GOES HERE
    # Print the value
    echo "Version : $value"

  else
    # The file does not exist
    echo "Version file does not exist for $module_path. IGNORING it"
  fi
done