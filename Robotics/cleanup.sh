#!/usr/bin/env zsh
# LaTeX Cleanup Script - macOS/Linux zsh/bash Version
# This script removes ALL files except *.tex and *.pdf files
# Cross-platform repository compatible

echo "🧹 Cleaning up LaTeX directory..."
echo "📝 Keeping only *.tex and *.pdf files"

# Get current directory
current_dir=$(pwd)
echo "📂 Current directory: $current_dir"

# Find files to keep and remove
files_to_keep=$(find . -maxdepth 1 -type f \( -name "*.tex" -o -name "*.pdf" \))
files_to_remove=$(find . -maxdepth 1 -type f ! -name "*.tex" ! -name "*.pdf" ! -name "cleanup.sh" ! -name "cleanup.ps1" ! -name "cleanup.bat")

echo ""
if [ -n "$files_to_keep" ]; then
    echo "✅ Files to keep:"
    echo "$files_to_keep" | sed 's|^\./|  ✓ |'
fi

echo ""
if [ -n "$files_to_remove" ]; then
    echo "❌ Files to remove:"
    echo "$files_to_remove" | sed 's|^\./|  ✗ |'
    
    echo ""
    read "confirm?Do you want to proceed? (y/N): "
    
    if [[ "$confirm" =~ ^[Yy]$ ]]; then
        echo "$files_to_remove" | while read -r file; do
            if [ -n "$file" ]; then
                echo "  🗑️  Removing: $(basename "$file")"
                rm -f "$file"
            fi
        done
        echo "✨ Cleanup completed!"
    else
        echo "⚠️  Cleanup cancelled."
    fi
else
    echo "✨ No files to remove. Directory is already clean!"
fi