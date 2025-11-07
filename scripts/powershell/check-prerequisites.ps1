#!/usr/bin/env pwsh

# Consolidated prerequisite checking script (PowerShell)
#
# This script provides unified prerequisite checking for Spec-Driven Development workflow.
# It replaces the functionality previously spread across multiple scripts.
#
# Usage: ./check-prerequisites.ps1 [OPTIONS]
#
# OPTIONS:
#   -Json               Output in JSON format
#   -RequireTasks       Require chapters.md to exist (for implementation phase)
#   -IncludeTasks       Include chapters.md in AVAILABLE_DOCS list
#   -PathsOnly          Only output path variables (no validation)
#   -Help, -h           Show help message

[CmdletBinding()]
param(
    [switch]$Json,
    [switch]$RequireTasks,
    [switch]$IncludeTasks,
    [switch]$PathsOnly,
    [switch]$Help
)

$ErrorActionPreference = 'Stop'

# Show help if requested
if ($Help) {
    Write-Output @"
Usage: check-prerequisites.ps1 [OPTIONS]

Consolidated prerequisite checking for Spec-Driven Development workflow.

OPTIONS:
  -Json               Output in JSON format
  -RequireTasks       Require chapters.md to exist (for implementation phase)
  -IncludeTasks       Include chapters.md in AVAILABLE_DOCS list
  -PathsOnly          Only output path variables (no prerequisite validation)
  -Help, -h           Show this help message

EXAMPLES:
  # Check task prerequisites (outline.md required)
  .\check-prerequisites.ps1 -Json
  
  # Check implementation prerequisites (outline.md + chapters.md required)
  .\check-prerequisites.ps1 -Json -RequireTasks -IncludeTasks
  
  # Get feature paths only (no validation)
  .\check-prerequisites.ps1 -PathsOnly

"@
    exit 0
}

# Source common functions
. "$PSScriptRoot/common.ps1"

# Get feature paths and validate branch
$paths = Get-WorldPathsEnv

if (-not (Test-FeatureBranch -Branch $paths.CURRENT_BRANCH -HasGit:$paths.HAS_GIT)) { 
    exit 1 
}

# If paths-only mode, output paths and exit (support combined -Json -PathsOnly)
if ($PathsOnly) {
    if ($Json) {
        [PSCustomObject]@{
            REPO_ROOT     = $paths.REPO_ROOT
            BRANCH        = $paths.CURRENT_BRANCH
            WORLD_DIR     = $paths.WORLD_DIR
            WORLD_FILE    = $paths.WORLD_FILE
            STORY_OUTLINE = $paths.STORY_OUTLINE
            CHAPTERS      = $paths.CHAPTERS
        } | ConvertTo-Json -Compress
    } else {
        Write-Output "REPO_ROOT: $($paths.REPO_ROOT)"
        Write-Output "BRANCH: $($paths.CURRENT_BRANCH)"
        Write-Output "WORLD_DIR: $($paths.WORLD_DIR)"
        Write-Output "WORLD_FILE: $($paths.WORLD_FILE)"
        Write-Output "STORY_OUTLINE: $($paths.STORY_OUTLINE)"
        Write-Output "CHAPTERS: $($paths.CHAPTERS)"
    }
    exit 0
}

# Validate required directories and files
if (-not (Test-Path $paths.WORLD_DIR -PathType Container)) {
    Write-Output "ERROR: World directory not found: $($paths.WORLD_DIR)"
    Write-Output "Run /worldkit.worldbuild first to create the world structure."
    exit 1
}

if (-not (Test-Path $paths.STORY_OUTLINE -PathType Leaf)) {
    Write-Output "ERROR: outline.md not found in $($paths.WORLD_DIR)"
    Write-Output "Run /worldkit.outline first to create the story outline."
    exit 1
}

# Check for chapters.md if required
if ($RequireTasks -and -not (Test-Path $paths.CHAPTERS -PathType Leaf)) {
    Write-Output "ERROR: chapters.md not found in $($paths.WORLD_DIR)"
    Write-Output "Run /worldkit.chapters first to create the chapter breakdown."
    exit 1
}

# Build list of available documents
$docs = @()

# Always check these optional docs
if (Test-Path $paths.RESEARCH) { $docs += 'research.md' }
if (Test-Path $paths.DATA_MODEL) { $docs += 'data-model.md' }

# Check contracts directory (only if it exists and has files)
if ((Test-Path $paths.CONTRACTS_DIR) -and (Get-ChildItem -Path $paths.CONTRACTS_DIR -ErrorAction SilentlyContinue | Select-Object -First 1)) { 
    $docs += 'contracts/' 
}

if (Test-Path $paths.QUICKSTART) { $docs += 'quickstart.md' }

# Include chapters.md if requested and it exists
if ($IncludeTasks -and (Test-Path $paths.CHAPTERS)) { 
    $docs += 'chapters.md' 
}

# Output results
if ($Json) {
    # JSON output
    [PSCustomObject]@{ 
        WORLD_DIR = $paths.WORLD_DIR
        AVAILABLE_DOCS = $docs 
    } | ConvertTo-Json -Compress
} else {
    # Text output
    Write-Output "WORLD_DIR:$($paths.WORLD_DIR)"
    Write-Output "AVAILABLE_DOCS:"
    
    # Show status of each potential document
    Test-FileExists -Path $paths.RESEARCH -Description 'research.md' | Out-Null
    Test-FileExists -Path $paths.DATA_MODEL -Description 'data-model.md' | Out-Null
    Test-DirHasFiles -Path $paths.CONTRACTS_DIR -Description 'contracts/' | Out-Null
    Test-FileExists -Path $paths.QUICKSTART -Description 'quickstart.md' | Out-Null
    
    if ($IncludeTasks) {
        Test-FileExists -Path $paths.CHAPTERS -Description 'chapters.md' | Out-Null
    }
}
