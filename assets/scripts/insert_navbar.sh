#!/bin/bash
# This script inserts a top navigation bar into Documenter.jl generated sites.
# The resulting output is similar to MultiDocumenter's navigation menu.
# It checks all HTML files in the specified directory and its subdirectories.

# Function to print usage
print_usage() {
    echo "Usage: $0 <html-directory> <navbar-url> [--exclude <path1,path2,...>]"
    echo "  --exclude: Optional comma-separated list of paths to exclude"
}

# Check if the minimum number of arguments are provided
if [ "$#" -lt 2 ]; then
    print_usage
    exit 1
fi

# Directory containing HTML files (passed as the first argument to the script)
HTML_DIR=$1
# URL of the navigation bar HTML file (passed as the second argument to the script)
NAVBAR_URL=$2
# Initialize exclude list
EXCLUDE_LIST=""

# Parse optional arguments
shift 2
while [[ $# -gt 0 ]]; do
    key="$1"
    case $key in
        --exclude)
            EXCLUDE_LIST="$2"
            shift 2
            ;;
        *)
            echo "Unknown option: $1"
            print_usage
            exit 1
            ;;
    esac
done

# Download the navigation bar HTML content
NAVBAR_HTML=$(curl -s $NAVBAR_URL)

# Check if the download was successful
if [ -z "$NAVBAR_HTML" ]; then
    echo "Failed to download navbar HTML"
    exit 1
fi

# Function to check if a file should be excluded
should_exclude() {
    local file="$1"
    IFS=',' read -ra EXCLUDE_PATHS <<< "$EXCLUDE_LIST"
    for exclude_path in "${EXCLUDE_PATHS[@]}"; do
        if [[ "$file" == *"$exclude_path"* ]]; then
            return 0  # Should exclude
        fi
    done
    return 1  # Should not exclude
}

# Process each HTML file in the directory and its subdirectories
find "$HTML_DIR" -name "*.html" | while read file; do
    # Check if the file should be excluded
    if [ ! -z "$EXCLUDE_LIST" ] && should_exclude "$file"; then
        echo "Skipping excluded file: $file"
        continue
    fi

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