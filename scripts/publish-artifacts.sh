#!/bin/bash

printf "TOTAL NUMBER OF MODULES THAT WILL BE PROCESSED : %d\n" $#

construct_artifact_path_heirarchy_and_get_module() {
    local input_string="$1"
    IFS="/" read -ra tokens <<< "$input_string"
    local num_tokens=${#tokens[@]}
    local provider_name="${tokens[1]}"
    local module_name="${tokens[num_tokens-1]}"
    local values=("providers/$provider_name/modules/$module_name" "$module_name")
    echo "${values[@]}"
}


version_file_name="version.json"

# Get the command line arguments
module_paths=$*
# Loop over the arguments
for module_path in $module_paths; do

  result_array=($(construct_artifact_path_heirarchy_and_get_module "$module_path"))
  artifact_path="${result_array[0]}"
  module_name="${result_array[1]}"

  # Check if the file exists in the directory
  printf "\nNOW PROCESSING FILES IN %s ... \n" $module_path
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
    printf "\tPublished %s.zip\n" "$version_number"

  else
    # The file does not exist
    printf "\tVersion file does not exist. IGNORING %s\n" "$module_path"
  fi
done
