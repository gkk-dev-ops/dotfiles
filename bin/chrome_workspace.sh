#!/bin/bash
# 
# Usage
# $ ./chrome_workspace.sh <file_path>
# 
# Script aims to open all the URLs in the file in saved text file (remember to
# leave trailing \n)
# 
# Easy way to save the URLs is to copy the URLs from the browser and paste it
# using cat > somthing.browser

# Specify the file path
file="$1"
if [ ! -f "$file" ]; then
    echo "File not found!"
    exit 1
fi

# Check if the file ends with .browser
if [[ "$file" != *.browser ]]; then
    echo "Invalid file format! File must end with .browser"
    exit 2
fi

# Read each line from the file
while IFS= read -r line; do
    # Run the command for each line
    if [[ "$line" == "" ]]; then
        continue
    fi
    open -a /Applications/Google\ Chrome.app "$line"
done < "$file"
