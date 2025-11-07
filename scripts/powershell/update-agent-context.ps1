#!/usr/bin/env pwsh
<#
.SYNOPSIS
Update agent context files with information from world.md (PowerShell version)

.DESCRIPTION
Mirrors the behavior of scripts/bash/update-agent-context.sh:
 1. Environment Validation
 2. World Data Extraction (from world.md)
 3. Agent File Management (create from template or update existing)
 4. Content Generation (story information, recent changes, timestamp)
 5. Multi-Agent Support (claude, gemini, copilot, cursor-agent, qwen, opencode, codex, windsurf, kilocode, auggie, roo, amp, q)

.PARAMETER AgentType
Optional agent key to update a single agent. If omitted, updates all existing agent files (creating a default Claude file if none exist).

.EXAMPLE
./update-agent-context.ps1 -AgentType claude

.EXAMPLE
./update-agent-context.ps1   # Updates all existing agent files

.NOTES
Relies on common helper functions in common.ps1
#>
param(
    [Parameter(Position=0)]
    [ValidateSet('claude','gemini','copilot','cursor-agent','qwen','opencode','codex','windsurf','kilocode','auggie','roo','codebuddy','amp','q')]
    [string]$AgentType
)

$ErrorActionPreference = 'Stop'

# Import common helpers
$ScriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
. (Join-Path $ScriptDir 'common.ps1')

# Acquire environment paths
$envData = Get-WorldPathsEnv
$REPO_ROOT     = $envData.REPO_ROOT
$CURRENT_BRANCH = $envData.CURRENT_BRANCH
$HAS_GIT       = $envData.HAS_GIT
$WORLD_FILE = $envData.WORLD_FILE
$NEW_WORLD = $WORLD_FILE

# Agent-specific file paths
$CLAUDE_FILE   = Join-Path $REPO_ROOT 'CLAUDE.md'
$GEMINI_FILE   = Join-Path $REPO_ROOT 'GEMINI.md'
$COPILOT_FILE  = Join-Path $REPO_ROOT '.github/copilot-instructions.md'
$CURSOR_FILE   = Join-Path $REPO_ROOT '.cursor/rules/worldbuild-rules.mdc'
$QWEN_FILE     = Join-Path $REPO_ROOT 'QWEN.md'
$AGENTS_FILE   = Join-Path $REPO_ROOT 'AGENTS.md'
$WINDSURF_FILE = Join-Path $REPO_ROOT '.windsurf/rules/worldbuild-rules.md'
$KILOCODE_FILE = Join-Path $REPO_ROOT '.kilocode/rules/worldbuild-rules.md'
$AUGGIE_FILE   = Join-Path $REPO_ROOT '.augment/rules/worldbuild-rules.md'
$ROO_FILE      = Join-Path $REPO_ROOT '.roo/rules/worldbuild-rules.md'
$CODEBUDDY_FILE= Join-Path $REPO_ROOT 'CODEBUDDY.md'
$AMP_FILE      = Join-Path $REPO_ROOT 'AGENTS.md'
$Q_FILE        = Join-Path $REPO_ROOT 'AGENTS.md'

$TEMPLATE_FILE = Join-Path $REPO_ROOT '.worldbuild/templates/agent-file-template.md'

# Parsed world data placeholders
$script:NEW_GENRE = ''
$script:NEW_SETTING = ''
$script:NEW_PROTAGONIST = ''
$script:NEW_STORY_TYPE = ''

function Write-Info { 
    param(
        [Parameter(Mandatory=$true)]
        [string]$Message
    )
    Write-Host "INFO: $Message" 
}

function Write-Success { 
    param(
        [Parameter(Mandatory=$true)]
        [string]$Message
    )
    Write-Host "$([char]0x2713) $Message" 
}

function Write-WarningMsg { 
    param(
        [Parameter(Mandatory=$true)]
        [string]$Message
    )
    Write-Warning $Message 
}

function Write-Err { 
    param(
        [Parameter(Mandatory=$true)]
        [string]$Message
    )
    Write-Host "ERROR: $Message" -ForegroundColor Red 
}

function Validate-Environment {
    if (-not $CURRENT_BRANCH) {
        Write-Err 'Unable to determine current story'
        if ($HAS_GIT) { Write-Info "Make sure you're on a story branch" } else { Write-Info 'Set WORLDBUILD_STORY environment variable or create a story first' }
        exit 1
    }
    if (-not (Test-Path $NEW_WORLD)) {
        Write-Err "No world.md found at $NEW_WORLD"
        Write-Info 'Ensure you are working on a story with a corresponding world directory'
        if (-not $HAS_GIT) { Write-Info 'Use: $env:WORLDBUILD_STORY=your-story-name or create a new story first' }
        exit 1
    }
    if (-not (Test-Path $TEMPLATE_FILE)) {
        Write-Err "Template file not found at $TEMPLATE_FILE"
        Write-Info 'Run worldbuild init to scaffold .worldbuild/templates, or add agent-file-template.md there.'
        exit 1
    }
}

function Extract-WorldField {
    param(
        [Parameter(Mandatory=$true)]
        [string]$FieldPattern,
        [Parameter(Mandatory=$true)]
        [string]$WorldFile
    )
    if (-not (Test-Path $WorldFile)) { return '' }
    # Lines like **Genre**: Fantasy
    $regex = "^\*\*$([Regex]::Escape($FieldPattern))\*\*: (.+)$"
    Get-Content -LiteralPath $WorldFile -Encoding utf8 | ForEach-Object {
        if ($_ -match $regex) { 
            $val = $Matches[1].Trim()
            if ($val -notin @('NEEDS CLARIFICATION','N/A')) { return $val }
        }
    } | Select-Object -First 1
}

function Parse-WorldData {
    param(
        [Parameter(Mandatory=$true)]
        [string]$WorldFile
    )
    if (-not (Test-Path $WorldFile)) { Write-Err "World file not found: $WorldFile"; return $false }
    Write-Info "Parsing world data from $WorldFile"
    $script:NEW_GENRE        = Extract-WorldField -FieldPattern 'Genre' -WorldFile $WorldFile
    $script:NEW_SETTING   = Extract-WorldField -FieldPattern 'Setting' -WorldFile $WorldFile
    $script:NEW_PROTAGONIST          = Extract-WorldField -FieldPattern 'Protagonist' -WorldFile $WorldFile
    $script:NEW_STORY_TYPE = Extract-WorldField -FieldPattern 'Story Type' -WorldFile $WorldFile

    if ($NEW_GENRE) { Write-Info "Found genre: $NEW_GENRE" } else { Write-WarningMsg 'No genre information found in world' }
    if ($NEW_SETTING) { Write-Info "Found setting: $NEW_SETTING" }
    if ($NEW_PROTAGONIST -and $NEW_PROTAGONIST -ne 'N/A') { Write-Info "Found protagonist: $NEW_PROTAGONIST" }
    if ($NEW_STORY_TYPE) { Write-Info "Found story type: $NEW_STORY_TYPE" }
    return $true
}

function Format-StoryInfo {
    param(
        [Parameter(Mandatory=$false)]
        [string]$Genre,
        [Parameter(Mandatory=$false)]
        [string]$Setting
    )
    $parts = @()
    if ($Genre -and $Genre -ne 'NEEDS CLARIFICATION') { $parts += $Genre }
    if ($Setting -and $Setting -notin @('NEEDS CLARIFICATION','N/A')) { $parts += $Setting }
    if (-not $parts) { return '' }
    return ($parts -join ' + ')
}

function Get-StoryStructure { 
    param(
        [Parameter(Mandatory=$false)]
        [string]$StoryType
    )
    if ($StoryType -match 'series') { return "world/`nbooks/`ncharacters/" } else { return "world/`nchapters/`ncharacters/" } 
}

function Get-RecommendedCommands { 
    param(
        [Parameter(Mandatory=$false)]
        [string]$Genre
    )
    switch -Regex ($Genre) {
        'Fantasy|Science Fiction' { return "/worldbuild; /character; /sensory; /bible" }
        'Mystery|Thriller' { return "/worldbuild; /outline; /chapters; /revise" }
        'Literary|Drama' { return "/character; /voice; /sensory; /revise" }
        default { return "# Add recommended commands for $Genre" }
    }
}

function Get-GenreConventions { 
    param(
        [Parameter(Mandatory=$false)]
        [string]$Genre
    )
    if ($Genre) { "${Genre}: Follow genre conventions and reader expectations" } else { 'General: Follow standard fiction writing conventions' } 
}

function New-AgentFile {
    param(
        [Parameter(Mandatory=$true)]
        [string]$TargetFile,
        [Parameter(Mandatory=$true)]
        [string]$StoryName,
        [Parameter(Mandatory=$true)]
        [datetime]$Date
    )
    if (-not (Test-Path $TEMPLATE_FILE)) { Write-Err "Template not found at $TEMPLATE_FILE"; return $false }
    $temp = New-TemporaryFile
    Copy-Item -LiteralPath $TEMPLATE_FILE -Destination $temp -Force

    $storyStructure = Get-StoryStructure -StoryType $NEW_STORY_TYPE
    $commands = Get-RecommendedCommands -Genre $NEW_GENRE
    $genreConventions = Get-GenreConventions -Genre $NEW_GENRE

    $escaped_genre = $NEW_GENRE
    $escaped_setting = $NEW_SETTING
    $escaped_branch = $CURRENT_BRANCH

    $content = Get-Content -LiteralPath $temp -Raw -Encoding utf8
    $content = $content -replace '\[WORLD NAME\]',$StoryName
    $content = $content -replace '\[DATE\]',$Date.ToString('yyyy-MM-dd')
    
    # Build the story info string safely
    $storyInfoForTemplate = ""
    if ($escaped_genre -and $escaped_setting) {
        $storyInfoForTemplate = "- $escaped_genre + $escaped_setting ($escaped_branch)"
    } elseif ($escaped_genre) {
        $storyInfoForTemplate = "- $escaped_genre ($escaped_branch)"
    } elseif ($escaped_setting) {
        $storyInfoForTemplate = "- $escaped_setting ($escaped_branch)"
    }
    
    $content = $content -replace '\[EXTRACTED FROM ALL OUTLINE.MD FILES\]',$storyInfoForTemplate
    # For story structure we manually embed (keep newlines)
    $escapedStructure = [Regex]::Escape($storyStructure)
    $content = $content -replace '\[ACTUAL STRUCTURE FROM OUTLINES\]',$escapedStructure
    # Replace escaped newlines placeholder after all replacements
    $content = $content -replace '\[ONLY COMMANDS RELEVANT TO CURRENT STORIES\]',$commands
    $content = $content -replace '\[GENRE-SPECIFIC, ONLY FOR GENRES IN USE\]',$genreConventions
    
    # Build the recent changes string safely
    $recentChangesForTemplate = ""
    if ($escaped_genre -and $escaped_setting) {
        $recentChangesForTemplate = "- ${escaped_branch}: Working on ${escaped_genre} + ${escaped_setting}"
    } elseif ($escaped_genre) {
        $recentChangesForTemplate = "- ${escaped_branch}: Working on ${escaped_genre}"
    } elseif ($escaped_setting) {
        $recentChangesForTemplate = "- ${escaped_branch}: Working on ${escaped_setting}"
    }
    
    $content = $content -replace '\[LAST 3 STORIES AND WHAT THEY ADDED TO THE WORLD\]',$recentChangesForTemplate
    # Convert literal \n sequences introduced by Escape to real newlines
    $content = $content -replace '\\n',[Environment]::NewLine

    $parent = Split-Path -Parent $TargetFile
    if (-not (Test-Path $parent)) { New-Item -ItemType Directory -Path $parent | Out-Null }
    Set-Content -LiteralPath $TargetFile -Value $content -NoNewline -Encoding utf8
    Remove-Item $temp -Force
    return $true
}

function Update-ExistingAgentFile {
    param(
        [Parameter(Mandatory=$true)]
        [string]$TargetFile,
        [Parameter(Mandatory=$true)]
        [datetime]$Date
    )
    if (-not (Test-Path $TargetFile)) { return (New-AgentFile -TargetFile $TargetFile -StoryName (Split-Path $REPO_ROOT -Leaf) -Date $Date) }

    $storyInfo = Format-StoryInfo -Genre $NEW_GENRE -Setting $NEW_SETTING
    $newStoryEntries = @()
    if ($storyInfo) {
        $escapedStoryInfo = [Regex]::Escape($storyInfo)
        if (-not (Select-String -Pattern $escapedStoryInfo -Path $TargetFile -Quiet)) { 
            $newStoryEntries += "- $storyInfo ($CURRENT_BRANCH)" 
        }
    }
    if ($NEW_PROTAGONIST -and $NEW_PROTAGONIST -notin @('N/A','NEEDS CLARIFICATION')) {
        $escapedProtagonist = [Regex]::Escape($NEW_PROTAGONIST)
        if (-not (Select-String -Pattern $escapedProtagonist -Path $TargetFile -Quiet)) { 
            $newStoryEntries += "- Protagonist: $NEW_PROTAGONIST ($CURRENT_BRANCH)" 
        }
    }
    $newChangeEntry = ''
    if ($storyInfo) { $newChangeEntry = "- ${CURRENT_BRANCH}: Working on ${storyInfo}" }
    elseif ($NEW_PROTAGONIST -and $NEW_PROTAGONIST -notin @('N/A','NEEDS CLARIFICATION')) { $newChangeEntry = "- ${CURRENT_BRANCH}: Working on protagonist ${NEW_PROTAGONIST}" }

    $lines = Get-Content -LiteralPath $TargetFile -Encoding utf8
    $output = New-Object System.Collections.Generic.List[string]
    $inStories = $false; $inChanges = $false; $storiesAdded = $false; $changeAdded = $false; $existingChanges = 0

    for ($i=0; $i -lt $lines.Count; $i++) {
        $line = $lines[$i]
        if ($line -eq '## Active Stories') {
            $output.Add($line)
            $inStories = $true
            continue
        }
        if ($inStories -and $line -match '^##\s') {
            if (-not $storiesAdded -and $newStoryEntries.Count -gt 0) { $newStoryEntries | ForEach-Object { $output.Add($_) }; $storiesAdded = $true }
            $output.Add($line); $inStories = $false; continue
        }
        if ($inStories -and [string]::IsNullOrWhiteSpace($line)) {
            if (-not $storiesAdded -and $newStoryEntries.Count -gt 0) { $newStoryEntries | ForEach-Object { $output.Add($_) }; $storiesAdded = $true }
            $output.Add($line); continue
        }
        if ($line -eq '## Recent Changes') {
            $output.Add($line)
            if ($newChangeEntry) { $output.Add($newChangeEntry); $changeAdded = $true }
            $inChanges = $true
            continue
        }
        if ($inChanges -and $line -match '^##\s') { $output.Add($line); $inChanges = $false; continue }
        if ($inChanges -and $line -match '^- ') {
            if ($existingChanges -lt 2) { $output.Add($line); $existingChanges++ }
            continue
        }
        if ($line -match '\*\*Last updated\*\*: .*\d{4}-\d{2}-\d{2}') {
            $output.Add(($line -replace '\d{4}-\d{2}-\d{2}',$Date.ToString('yyyy-MM-dd')))
            continue
        }
        $output.Add($line)
    }

    # Post-loop check: if we're still in the Active Stories section and haven't added new entries
    if ($inStories -and -not $storiesAdded -and $newStoryEntries.Count -gt 0) {
        $newStoryEntries | ForEach-Object { $output.Add($_) }
    }

    Set-Content -LiteralPath $TargetFile -Value ($output -join [Environment]::NewLine) -Encoding utf8
    return $true
}

function Update-AgentFile {
    param(
        [Parameter(Mandatory=$true)]
        [string]$TargetFile,
        [Parameter(Mandatory=$true)]
        [string]$AgentName
    )
    if (-not $TargetFile -or -not $AgentName) { Write-Err 'Update-AgentFile requires TargetFile and AgentName'; return $false }
    Write-Info "Updating $AgentName context file: $TargetFile"
    $storyName = Split-Path $REPO_ROOT -Leaf
    $date = Get-Date

    $dir = Split-Path -Parent $TargetFile
    if (-not (Test-Path $dir)) { New-Item -ItemType Directory -Path $dir | Out-Null }

    if (-not (Test-Path $TargetFile)) {
        if (New-AgentFile -TargetFile $TargetFile -StoryName $storyName -Date $date) { Write-Success "Created new $AgentName context file" } else { Write-Err 'Failed to create new agent file'; return $false }
    } else {
        try {
            if (Update-ExistingAgentFile -TargetFile $TargetFile -Date $date) { Write-Success "Updated existing $AgentName context file" } else { Write-Err 'Failed to update agent file'; return $false }
        } catch {
            Write-Err "Cannot access or update existing file: $TargetFile. $_"
            return $false
        }
    }
    return $true
}

function Update-SpecificAgent {
    param(
        [Parameter(Mandatory=$true)]
        [string]$Type
    )
    switch ($Type) {
        'claude'   { Update-AgentFile -TargetFile $CLAUDE_FILE   -AgentName 'Claude Code' }
        'gemini'   { Update-AgentFile -TargetFile $GEMINI_FILE   -AgentName 'Gemini CLI' }
        'copilot'  { Update-AgentFile -TargetFile $COPILOT_FILE  -AgentName 'GitHub Copilot' }
        'cursor-agent' { Update-AgentFile -TargetFile $CURSOR_FILE   -AgentName 'Cursor IDE' }
        'qwen'     { Update-AgentFile -TargetFile $QWEN_FILE     -AgentName 'Qwen Code' }
        'opencode' { Update-AgentFile -TargetFile $AGENTS_FILE   -AgentName 'opencode' }
        'codex'    { Update-AgentFile -TargetFile $AGENTS_FILE   -AgentName 'Codex CLI' }
        'windsurf' { Update-AgentFile -TargetFile $WINDSURF_FILE -AgentName 'Windsurf' }
        'kilocode' { Update-AgentFile -TargetFile $KILOCODE_FILE -AgentName 'Kilo Code' }
        'auggie'   { Update-AgentFile -TargetFile $AUGGIE_FILE   -AgentName 'Auggie CLI' }
        'roo'      { Update-AgentFile -TargetFile $ROO_FILE      -AgentName 'Roo Code' }
        'codebuddy' { Update-AgentFile -TargetFile $CODEBUDDY_FILE -AgentName 'CodeBuddy CLI' }
        'amp'      { Update-AgentFile -TargetFile $AMP_FILE      -AgentName 'Amp' }
        'q'        { Update-AgentFile -TargetFile $Q_FILE        -AgentName 'Amazon Q Developer CLI' }
        default { Write-Err "Unknown agent type '$Type'"; Write-Err 'Expected: claude|gemini|copilot|cursor-agent|qwen|opencode|codex|windsurf|kilocode|auggie|roo|codebuddy|amp|q'; return $false }
    }
}

function Update-AllExistingAgents {
    $found = $false
    $ok = $true
    if (Test-Path $CLAUDE_FILE)   { if (-not (Update-AgentFile -TargetFile $CLAUDE_FILE   -AgentName 'Claude Code')) { $ok = $false }; $found = $true }
    if (Test-Path $GEMINI_FILE)   { if (-not (Update-AgentFile -TargetFile $GEMINI_FILE   -AgentName 'Gemini CLI')) { $ok = $false }; $found = $true }
    if (Test-Path $COPILOT_FILE)  { if (-not (Update-AgentFile -TargetFile $COPILOT_FILE  -AgentName 'GitHub Copilot')) { $ok = $false }; $found = $true }
    if (Test-Path $CURSOR_FILE)   { if (-not (Update-AgentFile -TargetFile $CURSOR_FILE   -AgentName 'Cursor IDE')) { $ok = $false }; $found = $true }
    if (Test-Path $QWEN_FILE)     { if (-not (Update-AgentFile -TargetFile $QWEN_FILE     -AgentName 'Qwen Code')) { $ok = $false }; $found = $true }
    if (Test-Path $AGENTS_FILE)   { if (-not (Update-AgentFile -TargetFile $AGENTS_FILE   -AgentName 'Codex/opencode')) { $ok = $false }; $found = $true }
    if (Test-Path $WINDSURF_FILE) { if (-not (Update-AgentFile -TargetFile $WINDSURF_FILE -AgentName 'Windsurf')) { $ok = $false }; $found = $true }
    if (Test-Path $KILOCODE_FILE) { if (-not (Update-AgentFile -TargetFile $KILOCODE_FILE -AgentName 'Kilo Code')) { $ok = $false }; $found = $true }
    if (Test-Path $AUGGIE_FILE)   { if (-not (Update-AgentFile -TargetFile $AUGGIE_FILE   -AgentName 'Auggie CLI')) { $ok = $false }; $found = $true }
    if (Test-Path $ROO_FILE)      { if (-not (Update-AgentFile -TargetFile $ROO_FILE      -AgentName 'Roo Code')) { $ok = $false }; $found = $true }
    if (Test-Path $CODEBUDDY_FILE) { if (-not (Update-AgentFile -TargetFile $CODEBUDDY_FILE -AgentName 'CodeBuddy CLI')) { $ok = $false }; $found = $true }
    if (Test-Path $Q_FILE)        { if (-not (Update-AgentFile -TargetFile $Q_FILE        -AgentName 'Amazon Q Developer CLI')) { $ok = $false }; $found = $true }
    if (-not $found) {
        Write-Info 'No existing agent files found, creating default Claude file...'
        if (-not (Update-AgentFile -TargetFile $CLAUDE_FILE -AgentName 'Claude Code')) { $ok = $false }
    }
    return $ok
}

function Print-Summary {
    Write-Host ''
    Write-Info 'Summary of changes:'
    if ($NEW_GENRE) { Write-Host "  - Working on genre: $NEW_GENRE" }
    if ($NEW_SETTING) { Write-Host "  - Working on setting: $NEW_SETTING" }
    if ($NEW_PROTAGONIST -and $NEW_PROTAGONIST -ne 'N/A') { Write-Host "  - Working on protagonist: $NEW_PROTAGONIST" }
    Write-Host ''
    Write-Info 'Usage: ./update-agent-context.ps1 [-AgentType claude|gemini|copilot|cursor-agent|qwen|opencode|codex|windsurf|kilocode|auggie|roo|codebuddy|amp|q]'
}

function Main {
    Validate-Environment
    Write-Info "=== Updating agent context files for story $CURRENT_BRANCH ==="
    if (-not (Parse-WorldData -WorldFile $NEW_WORLD)) { Write-Err 'Failed to parse world data'; exit 1 }
    $success = $true
    if ($AgentType) {
        Write-Info "Updating specific agent: $AgentType"
        if (-not (Update-SpecificAgent -Type $AgentType)) { $success = $false }
    }
    else {
        Write-Info 'No agent specified, updating all existing agent files...'
        if (-not (Update-AllExistingAgents)) { $success = $false }
    }
    Print-Summary
    if ($success) { Write-Success 'Agent context update completed successfully'; exit 0 } else { Write-Err 'Agent context update completed with errors'; exit 1 }
}

Main

