#!/usr/bin/env pwsh
# Setup implementation plan for a feature

[CmdletBinding()]
param(
    [switch]$Json,
    [switch]$Help
)

$ErrorActionPreference = 'Stop'

# Show help if requested
if ($Help) {
    Write-Output "Usage: ./setup-plan.ps1 [-Json] [-Help]"
    Write-Output "  -Json     Output results in JSON format"
    Write-Output "  -Help     Show this help message"
    exit 0
}

# Load common functions
. "$PSScriptRoot/common.ps1"

# Get all paths and variables from common functions
$paths = Get-WorldPathsEnv

# Check if we're on a proper story branch (only for git repos)
if (-not (Test-FeatureBranch -Branch $paths.CURRENT_BRANCH -HasGit $paths.HAS_GIT)) { 
    exit 1 
}

# Ensure the world directory exists
New-Item -ItemType Directory -Path $paths.WORLD_DIR -Force | Out-Null

# Copy outline template if it exists, otherwise note it or create empty file
$template = Join-Path $paths.REPO_ROOT '.worldbuild/templates/outline-template.md'
if (Test-Path $template) { 
    Copy-Item $template $paths.STORY_OUTLINE -Force
    Write-Output "Copied outline template to $($paths.STORY_OUTLINE)"
} else {
    Write-Warning "Outline template not found at $template"
    # Create a basic outline file if template doesn't exist
    New-Item -ItemType File -Path $paths.STORY_OUTLINE -Force | Out-Null
}

# Output results
if ($Json) {
    $result = [PSCustomObject]@{ 
        WORLD_FILE = $paths.WORLD_FILE
        STORY_OUTLINE = $paths.STORY_OUTLINE
        WORLD_DIR = $paths.WORLD_DIR
        BRANCH = $paths.CURRENT_BRANCH
        HAS_GIT = $paths.HAS_GIT
    }
    $result | ConvertTo-Json -Compress
} else {
    Write-Output "WORLD_FILE: $($paths.WORLD_FILE)"
    Write-Output "STORY_OUTLINE: $($paths.STORY_OUTLINE)"
    Write-Output "WORLD_DIR: $($paths.WORLD_DIR)"
    Write-Output "BRANCH: $($paths.CURRENT_BRANCH)"
    Write-Output "HAS_GIT: $($paths.HAS_GIT)"
}

