#!/bin/bash

# This script inserts a top navigation bar (e.g., `navbar.html`) into Documenter.jl generated sites.
# The resulting output is similar to MultiDocumenter's navigation menu. The navigation menu is
# hard-coded at the moment, which could be improved in the future. 
# It checks all HTML files in the specified directory and its subdirectories.
# The script also avoids inserting the navbar if it's already present.

# URL of the navigation bar HTML file
NAVBAR_URL="https://raw.githubusercontent.com/TuringLang/turinglang.github.io/main/assets/scripts/navbar.html"

# Directory containing HTML files (passed as the first argument to the script)
HTML_DIR=$1

# Download the navigation bar HTML content
NAVBAR_HTML=$(curl -s $NAVBAR_URL)

# Check if the download was successful
if [ -z "$NAVBAR_HTML" ]; then
    echo "Failed to download navbar HTML"
    exit 1
fi

# Process each HTML file in the directory and its subdirectories
find "$HTML_DIR" -name "*.html" | while read file; do
    # Check if the navbar is already present using the comment
    if ! grep -q "<!-- NAVBAR START -->" "$file"; then
        # Read the contents of the HTML file
        file_contents=$(cat "$file")
        
        # Insert the navbar HTML after the <body> tag
        updated_contents="${file_contents/<body>/<body>$NAVBAR_HTML}"
        
        # Write the updated contents back to the file
        echo "$updated_contents" > "$file"
        echo "Updated $file"
    else
        echo "Skipped $file (navbar already present)"
    fi
done