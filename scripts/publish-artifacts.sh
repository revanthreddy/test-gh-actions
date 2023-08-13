#!/bin/bash

printf "Total number of modules that will be processed : %d\n\n\n" $#

version_file_name="version.json"

# Get the command line arguments
module_paths=$@
# Loop over the arguments
for module_path in $module_paths; do

  # Check if the file exists in the directory
  printf "Now processing files in %s ... \n" $module_path
  if [ -f "$module_path/$version_file_name" ]; then
    # Get the key to extract
    key="version"

    # Open the JSON file & Get the version_number for the key
    module_version_file=$(cat "$module_path/$version_file_name")
    version_number=$(echo "$module_version_file" | jq ".$key")

    if [ -z "$version_number" ]; then
      printf "\tThe key %s does not exist in the JSON file %s.\n" $key $version_file_name
      continue
    fi
    # ZIP THE CONTENTS WITH VERSION NAME BEING THE ZIP FILE NAME

    temp_directory=$(mktemp -d) # Create a temporary directory and copy files (excluding version.json)
    for file in $(find "$module_path" -type f | grep -vE "$version_file_name"); do
      cp "$file" "$temp_directory"
    done

    # Zip the contents of the temporary directory
    zip -r "$version_number.zip" "$temp_directory"

    # Remove the temporary directory
    rm -rf "$temp_directory"
    # PUBLISH TO JFROG CODE GOES HERE
    printf "\tPublished %s.zip\n" $version_number


  else
    # The file does not exist
    printf "\tVersion file does not exist for %s. IGNORING it\n" $module_path
  fi
done
