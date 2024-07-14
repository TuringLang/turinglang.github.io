#!/bin/bash

# This script inserts a top navigation bar into Documenter.jl generated sites.
# The resulting output is similar to MultiDocumenter's navigation menu. The navigation menu is
# hard-coded at the moment, which could be improved in the future. 
# It checks all HTML files in the specified directory and its subdirectories.

# Check if the correct number of arguments are provided
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <html-directory> <navbar-url>"
    exit 1
fi

# Directory containing HTML files (passed as the first argument to the script)
HTML_DIR=$1

# URL of the navigation bar HTML file (passed as the second argument to the script)
NAVBAR_URL=$2

# Download the navigation bar HTML content
NAVBAR_HTML=$(curl -s $NAVBAR_URL)

# Check if the download was successful
if [ -z "$NAVBAR_HTML" ]; then
    echo "Failed to download navbar HTML"
    exit 1
fi

# Process each HTML file in the directory and its subdirectories
find "$HTML_DIR" -name "*.html" | while read file; do
    # Remove the existing navbar HTML section if present
    if grep -q "<!-- NAVBAR START -->" "$file"; then
        awk '/<!-- NAVBAR START -->/{flag=1;next}/<!-- NAVBAR END -->/{flag=0;next}!flag' "$file" > temp && mv temp "$file"
        echo "Removed existing navbar from $file"
    fi

    # Read the contents of the HTML file
    file_contents=$(cat "$file")

    # Insert the navbar HTML after the <body> tag
    updated_contents="${file_contents/<body>/<body>
$NAVBAR_HTML
}"

    # Write the updated contents back to the file
    echo "$updated_contents" > "$file"

    # Remove trailing blank lines immediately after the navbar
    awk 'BEGIN {RS=""; ORS="\n\n"} {gsub(/\n+$/, ""); print}' "$file" > temp_cleaned && mv temp_cleaned "$file"

    echo "Inserted new navbar into $file"
done