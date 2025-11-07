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
eval $(get_feature_paths)

# Check if we're on a proper feature branch (only for git repos)
check_feature_branch "$CURRENT_BRANCH" "$HAS_GIT" || exit 1

# Ensure the feature directory exists
mkdir -p "$STORY_DIR"

# Copy plan template if it exists
TEMPLATE="$REPO_ROOT/.worldbuild/templates/plan-template.md"
if [[ -f "$TEMPLATE" ]]; then
    cp "$TEMPLATE" "$STORY_OUTLINE"
    echo "Copied plan template to $STORY_OUTLINE"
else
    echo "Warning: Plan template not found at $TEMPLATE"
    # Create a basic plan file if template doesn't exist
    touch "$STORY_OUTLINE"
fi

# Output results
if $JSON_MODE; then
    printf '{"STORY_SPEC":"%s","STORY_OUTLINE":"%s","WORLDS_DIR":"%s","BRANCH":"%s","HAS_GIT":"%s"}\n' \
        "$STORY_SPEC" "$STORY_OUTLINE" "$STORY_DIR" "$CURRENT_BRANCH" "$HAS_GIT"
else
    echo "STORY_SPEC: $STORY_SPEC"
    echo "STORY_OUTLINE: $STORY_OUTLINE" 
    echo "WORLDS_DIR: $STORY_DIR"
    echo "BRANCH: $CURRENT_BRANCH"
    echo "HAS_GIT: $HAS_GIT"
fi

