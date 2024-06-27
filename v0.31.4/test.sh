#!/bin/bash

# Content to be inserted
read -r -d '' deprecation_notice << 'EOM'
<style>
  .deprecated-notice {
    background-color: #FFAB91;
    color: #333;
    text-align: center;
    padding: 10px;
    font-family: Georgia, 'Times New Roman', Times, serif;
    font-size: 16px;
    line-height: 1.5;
    position: fixed;
    top: 0;
    left: 0;
    right: 0;
    z-index: 9999;
  }

  .deprecated-notice a {
    color: #0066cc;
    text-decoration: underline;
  }

  body {
    padding-top: 40px;
  }

  .md-header {
    top: 40px;
    position: fixed;
    left: 0;
    right: 0;
    z-index: 9998;
  }

  @media (max-width: 600px) {
    .deprecated-notice {
      font-size: 14px;
      padding: 8px;
    }

    body {
      padding-top: 36px;
    }

    .md-header {
      top: 36px;
    }

    .md-sidebar {
      top: 36px;
    }
  }
</style>

<div class="deprecated-notice">
  This website is deprecated. Please visit our new website <a href="https://turinglang.org/">here</a>.
</div>
EOM

# Function to add deprecation warning to HTML files
add_deprecation_warning() {
    local file="$1"
   
    # Backup the original file
    cp "$file" "$file.bak"
   
    # Use awk to insert the deprecation warning just after <body> tag
    awk -v notice="$deprecation_notice" '
    /<body dir="ltr" data-md-color-primary="red" data-md-color-accent="red">/ {
        print $0
        print notice
        next
    }
    {print}
    ' "$file.bak" > "$file"
   
    echo "Deprecation warning added to $file"
}

# Function to recursively process directories
process_directory() {
    local dir="$1"
   
    # Process each file in the current directory
    for file in "$dir"/*.html; do
        if [ -f "$file" ]; then
            add_deprecation_warning "$file"
        fi
    done
   
    # Recursively process subdirectories
    for subdir in "$dir"/*/; do
        if [ -d "$subdir" ]; then
            process_directory "$subdir"
        fi
    done
}

# Main execution starts here
# Process current directory
process_directory "."

# Delete temporary backup files (*.html.bak)
find . -type f -name '*.html.bak' -delete

echo "All HTML files processed and temporary backup files deleted."