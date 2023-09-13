#!/bin/bash

# The script takes two command line arguments: the path to the file to modify, and the path to the file containing the key-value pairs to replace. If no second argument is provided, it defaults to ./.env.
#
# The script loops through each line in the key-value file.
#
# For each line, the script extracts the key and value using cut.
#
# The script then uses awk to replace the value in the specified file with the value from the key-value file. The -v option is used to pass the key and value as variables to awk. The -F option is used to set the field separator to =. The '$1 == key {$2=value}1' expression is used to match lines where the first field (the key) matches the specified key, and replace the second field (the value) with the specified value. The OFS variable is used to set the output field separator to =. The output is redirected to a temporary file, which is then moved to the original file using mv.
#
# The script repeats this process for each line in the key-value file, effectively replacing all specified key-value pairs in the specified file.
#
# The key-value file should be in the format key=value, with one key-value pair per line. For example:
#
# ```
# DATABASE_HOST=localhost
# DATABASE_PORT=5432
# DATABASE_NAME=mydatabase
# DATABASE_USER=myuser
# DATABASE_PASSWORD=mypassword
# ```
#
# mypassword
# The specified file should contain the keys to replace, in the format key=value, with one key-value pair per line. For example:
#
# ```
# DATABASE_HOST=example.com
# DATABASE_USER=exampleuser
# ```
#
# exampleuser
# In this example, the script would replace the DATABASE_HOST and DATABASE_USER values in the specified file with the values from the key-value file (localhost would be replaced with example.com, and myuser would be replaced with exampleuser).
#
#
# Get the path to the file to modify from the command line argument
file_to_modify=${2:-"./.bashrc"}

# Get the path to the key-value file from the command line argument, or use "./.env" as the default
key_value_file=${2:-"./.env"}

# Loop through each line in the file
while read line; do
  # Get the key and value from the line
  key=$(echo $line | cut -d= -f1)
  value=$(echo $line | cut -d= -f2)

  # Replace the value in the file with the value from the .env file
  awk -v key="$key" -v value="$value" -F= '$1 == key {$2=value}1' OFS="=" $file_to_modify > tmp && mv tmp $file_to_modify
done < $key_value_file