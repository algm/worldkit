#!/usr/bin/env bash
set -euo pipefail

# get-next-version.sh
# Calculate the next version based on the latest git tag and output GitHub Actions variables
# Usage: get-next-version.sh

# Get the latest tag, or use v0.0.0 if no tags exist
LATEST_TAG=$(git describe --tags --abbrev=0 2>/dev/null || echo "v0.0.0")
echo "latest_tag=$LATEST_TAG" >> $GITHUB_OUTPUT

# Check if pyproject.toml exists and extract version from it
if [ -f "pyproject.toml" ]; then
  PYPROJECT_VERSION=$(grep '^version = ' pyproject.toml | sed -n 's/^version = [\"'\'']\([^\"'\'']*\)[\"'\''].*$/\1/p' | tr -d ' ')
  if [ -n "$PYPROJECT_VERSION" ]; then
    NEW_VERSION="v$PYPROJECT_VERSION"
    echo "new_version=$NEW_VERSION" >> $GITHUB_OUTPUT
    echo "Using version from pyproject.toml: $NEW_VERSION"
    exit 0
  fi
fi

# Fallback: Extract version number and increment
VERSION=$(echo $LATEST_TAG | sed 's/v//')
IFS='.' read -ra VERSION_PARTS <<< "$VERSION"
MAJOR=${VERSION_PARTS[0]:-0}
MINOR=${VERSION_PARTS[1]:-0}
PATCH=${VERSION_PARTS[2]:-0}

# Increment patch version
PATCH=$((PATCH + 1))
NEW_VERSION="v$MAJOR.$MINOR.$PATCH"

echo "new_version=$NEW_VERSION" >> $GITHUB_OUTPUT
echo "New version will be: $NEW_VERSION"
