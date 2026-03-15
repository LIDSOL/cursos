#!/bin/bash

# Ensure we are in the script's directory
cd "$(dirname "$0")"

echo "Starting compilation of markdown presentations..."

# Loop through all markdown files that match our naming pattern
for md_file in [0-9]*.md; do
    # Check if the file exists (handles the case where no files match)
    [ -e "$md_file" ] || continue
    
    # Strip the .md extension and add .pdf
    pdf_file="${md_file%.md}.pdf"
    
    echo "Compiling $md_file -> $pdf_file..."
    
    # Run the pandoc command with the beamer template and our preamble
    pandoc -t beamer -H preamble.tex "$md_file" -o "$pdf_file"
    
    if [ $? -eq 0 ]; then
        echo "  ✓ Success"
    else
        echo "  ✗ Failed to compile $md_file"
    fi
done

echo "All tasks completed!"