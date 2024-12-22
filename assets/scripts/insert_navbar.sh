#!/bin/bash
# This script inserts a top navigation bar into Documenter.jl-generated sites.
# The resulting output is similar to MultiDocumenter's navigation menu.
# It checks all HTML files in the specified directory and its subdirectories,
# removes any existing navbar, then inserts the new navbar right after <body>.

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

# Directory containing HTML files
HTML_DIR=$1
# Source of the navigation bar HTML file
NAVBAR_SOURCE=$2
# Shift off the first two arguments so we can parse the rest
shift 2

# Initialize exclude list
EXCLUDE_LIST=""

# Parse optional arguments
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

# Determine if NAVBAR_SOURCE is a URL (starts with http or https) or a file path
if [[ $NAVBAR_SOURCE == http* ]]; then
    NAVBAR_HTML=$(curl -s "$NAVBAR_SOURCE")
else
    NAVBAR_HTML=$(cat "$NAVBAR_SOURCE")
fi

# Check if the download was successful
if [ -z "$NAVBAR_HTML" ]; then
    echo "Failed to download navbar HTML from '$NAVBAR_SOURCE'"
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

# Find and process each HTML file
find "$HTML_DIR" -type f -name "*.html" | while read -r file; do
    # Check if the file should be excluded
    if [ -n "$EXCLUDE_LIST" ] && should_exclude "$file"; then
        echo "Skipping excluded file: $file"
        continue
    fi

    # Remove existing navbar (if any) between <!-- NAVBAR START --> and <!-- NAVBAR END -->
    if grep -q "<!-- NAVBAR START -->" "$file"; then
        awk '/<!-- NAVBAR START -->/{flag=1;next}/<!-- NAVBAR END -->/{flag=0;next}!flag' "$file" > temp && mv temp "$file"
        echo "Removed existing navbar from $file"
    fi

    # Insert the new navbar right after the first <body> tag using awk
    awk -v nav="$NAVBAR_HTML" '
    /<body>/ {
        print $0
        print nav
        next
    }
    { print }
    ' "$file" > temp && mv temp "$file"

    # Remove excessive trailing blank lines after insertion
    awk 'BEGIN {RS=""; ORS="\n\n"} {gsub(/\n+$/, ""); print}' "$file" > temp_cleaned && mv temp_cleaned "$file"

    echo "Inserted new navbar into $file"
done
