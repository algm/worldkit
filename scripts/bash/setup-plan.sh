#!/usr/bin/env bash

set -e

# Parse command line arguments
JSON_MODE=false
ARGS=()

for arg in "$@"; do
    case "$arg" in
        --json) 
            JSON_MODE=true 
            ;;
        --help|-h) 
            echo "Usage: $0 [--json]"
            echo "  --json    Output results in JSON format"
            echo "  --help    Show this help message"
            exit 0 
            ;;
        *) 
            ARGS+=("$arg") 
            ;;
    esac
done

# Get script directory and load common functions
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/common.sh"

# Get all paths and variables from common functions
eval $(get_world_paths)

# Check if we're on a proper story branch (only for git repos)
check_feature_branch "$CURRENT_BRANCH" "$HAS_GIT" || exit 1

# Ensure the world directory exists
mkdir -p "$WORLD_DIR"

# Copy outline template if it exists
TEMPLATE="$REPO_ROOT/.worldbuild/templates/outline-template.md"
if [[ -f "$TEMPLATE" ]]; then
    cp "$TEMPLATE" "$STORY_OUTLINE"
    echo "Copied outline template to $STORY_OUTLINE"
else
    echo "Warning: Outline template not found at $TEMPLATE"
    # Create a basic outline file if template doesn't exist
    touch "$STORY_OUTLINE"
fi

# Output results
if $JSON_MODE; then
    printf '{"WORLD_FILE":"%s","STORY_OUTLINE":"%s","WORLD_DIR":"%s","BRANCH":"%s","HAS_GIT":"%s"}\n' \
        "$WORLD_FILE" "$STORY_OUTLINE" "$WORLD_DIR" "$CURRENT_BRANCH" "$HAS_GIT"
else
    echo "WORLD_FILE: $WORLD_FILE"
    echo "STORY_OUTLINE: $STORY_OUTLINE" 
    echo "WORLD_DIR: $WORLD_DIR"
    echo "BRANCH: $CURRENT_BRANCH"
    echo "HAS_GIT: $HAS_GIT"
fi

