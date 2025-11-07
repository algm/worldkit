#!/usr/bin/env pwsh
# Common PowerShell functions analogous to common.sh

function Get-RepoRoot {
    try {
        $result = git rev-parse --show-toplevel 2>$null
        if ($LASTEXITCODE -eq 0) {
            return $result
        }
    } catch {
        # Git command failed
    }
    
    # Fall back to script location for non-git repos
    return (Resolve-Path (Join-Path $PSScriptRoot "../../..")).Path
}

function Get-CurrentBranch {
    # First check if WORLDBUILD_STORY environment variable is set
    if ($env:WORLDBUILD_STORY) {
        return $env:WORLDBUILD_STORY
    }
    
    # Then check git if available
    try {
        $result = git rev-parse --abbrev-ref HEAD 2>$null
        if ($LASTEXITCODE -eq 0) {
            return $result
        }
    } catch {
        # Git command failed
    }
    
    # For non-git repos, try to find the latest feature directory
    $repoRoot = Get-RepoRoot
    $worldsDir = Join-Path $repoRoot "worlds"
    
    if (Test-Path $worldsDir) {
        $latestFeature = ""
        $highest = 0
        
        Get-ChildItem -Path $worldsDir -Directory | ForEach-Object {
            if ($_.Name -match '^(\d{3})-') {
                $num = [int]$matches[1]
                if ($num -gt $highest) {
                    $highest = $num
                    $latestFeature = $_.Name
                }
            }
        }
        
        if ($latestFeature) {
            return $latestFeature
        }
    }
    
    # Final fallback
    return "main"
}

function Test-HasGit {
    try {
        git rev-parse --show-toplevel 2>$null | Out-Null
        return ($LASTEXITCODE -eq 0)
    } catch {
        return $false
    }
}

function Test-FeatureBranch {
    param(
        [string]$Branch,
        [bool]$HasGit = $true
    )
    
    # For non-git repos, we can't enforce branch naming but still provide output
    if (-not $HasGit) {
        Write-Warning "[worldbuild] Warning: Git repository not detected; skipped branch validation"
        return $true
    }
    
    if ($Branch -notmatch '^[0-9]{3}-') {
        Write-Output "ERROR: Not on a story branch. Current branch: $Branch"
        Write-Output "Story branches should be named like: 001-story-name"
        return $false
    }
    return $true
}

function Get-FeatureDir {
    param([string]$RepoRoot, [string]$Branch)
    Join-Path $RepoRoot "worlds/$Branch"
}

function Get-WorldPathsEnv {
    $repoRoot = Get-RepoRoot
    $currentBranch = Get-CurrentBranch
    $hasGit = Test-HasGit
    $worldDir = Get-FeatureDir -RepoRoot $repoRoot -Branch $currentBranch
    
    [PSCustomObject]@{
        REPO_ROOT     = $repoRoot
        CURRENT_BRANCH = $currentBranch
        HAS_GIT       = $hasGit
        WORLD_DIR     = $worldDir
        WORLD_FILE    = Join-Path $worldDir 'world.md'
        STORY_OUTLINE = Join-Path $worldDir 'outline.md'
        CHAPTERS      = Join-Path $worldDir 'chapters.md'
        RESEARCH      = Join-Path $worldDir 'research.md'
        DATA_MODEL    = Join-Path $worldDir 'data-model.md'
        QUICKSTART    = Join-Path $worldDir 'quickstart.md'
        CONTRACTS_DIR = Join-Path $worldDir 'contracts'
    }
}

# Legacy function name for backward compatibility
# DEPRECATED: Use Get-WorldPathsEnv instead. This alias will be maintained for 
# backward compatibility but may be removed in a future version.
function Get-FeaturePathsEnv {
    Get-WorldPathsEnv
}

function Test-FileExists {
    param([string]$Path, [string]$Description)
    if (Test-Path -Path $Path -PathType Leaf) {
        Write-Output "  ✓ $Description"
        return $true
    } else {
        Write-Output "  ✗ $Description"
        return $false
    }
}

function Test-DirHasFiles {
    param([string]$Path, [string]$Description)
    if ((Test-Path -Path $Path -PathType Container) -and (Get-ChildItem -Path $Path -ErrorAction SilentlyContinue | Where-Object { -not $_.PSIsContainer } | Select-Object -First 1)) {
        Write-Output "  ✓ $Description"
        return $true
    } else {
        Write-Output "  ✗ $Description"
        return $false
    }
}

