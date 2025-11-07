#!/usr/bin/env bash

# Update agent context files with information from world.md and outline.md
#
# This script maintains AI agent context files by parsing world specifications 
# and updating agent-specific configuration files with story information.
#
# MAIN FUNCTIONS:
# 1. Environment Validation
#    - Verifies git repository structure and branch information
#    - Checks for required world.md files and templates
#    - Validates file permissions and accessibility
#
# 2. World Data Extraction
#    - Parses world.md files to extract story metadata
#    - Identifies genre, setting, characters, and story type
#    - Handles missing or incomplete world data gracefully
#
# 3. Agent File Management
#    - Creates new agent context files from templates when needed
#    - Updates existing agent files with new story information
#    - Preserves manual additions and custom configurations
#    - Supports multiple AI agent formats and directory structures
#
# 4. Content Generation
#    - Generates story-specific context information
#    - Creates appropriate directory references
#    - Updates recent changes sections
#    - Maintains consistent formatting and timestamps
#
# 5. Multi-Agent Support
#    - Handles agent-specific file paths and naming conventions
#    - Supports: Claude, Gemini, Copilot, Cursor, Qwen, opencode, Codex, Windsurf, Kilo Code, Auggie CLI, Roo Code, CodeBuddy CLI, Amp, or Amazon Q Developer CLI
#    - Can update single agents or all existing agent files
#    - Creates default Claude file if no agent files exist
#
# Usage: ./update-agent-context.sh [agent_type]
# Agent types: claude|gemini|copilot|cursor-agent|qwen|opencode|codex|windsurf|kilocode|auggie|roo|codebuddy|amp|q
# Leave empty to update all existing agent files

set -e

# Enable strict error handling
set -u
set -o pipefail

#==============================================================================
# Configuration and Global Variables
#==============================================================================

# Get script directory and load common functions
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/common.sh"

# Get all paths and variables from common functions
eval $(get_world_paths)

WORLD_FILE_PATH="$WORLD_FILE"  # Alias for compatibility with existing code
AGENT_TYPE="${1:-}"

# Agent-specific file paths  
CLAUDE_FILE="$REPO_ROOT/CLAUDE.md"
GEMINI_FILE="$REPO_ROOT/GEMINI.md"
COPILOT_FILE="$REPO_ROOT/.github/copilot-instructions.md"
CURSOR_FILE="$REPO_ROOT/.cursor/rules/worldbuild-rules.mdc"
QWEN_FILE="$REPO_ROOT/QWEN.md"
AGENTS_FILE="$REPO_ROOT/AGENTS.md"
WINDSURF_FILE="$REPO_ROOT/.windsurf/rules/worldbuild-rules.md"
KILOCODE_FILE="$REPO_ROOT/.kilocode/rules/worldbuild-rules.md"
AUGGIE_FILE="$REPO_ROOT/.augment/rules/worldbuild-rules.md"
ROO_FILE="$REPO_ROOT/.roo/rules/worldbuild-rules.md"
CODEBUDDY_FILE="$REPO_ROOT/CODEBUDDY.md"
AMP_FILE="$REPO_ROOT/AGENTS.md"
Q_FILE="$REPO_ROOT/AGENTS.md"

# Template file
TEMPLATE_FILE="$REPO_ROOT/.worldbuild/templates/agent-file-template.md"

# Global variables for parsed world data
GENRE=""
SETTING=""
STORY_TYPE=""
PROTAGONIST=""

#==============================================================================
# Utility Functions
#==============================================================================

log_info() {
    echo "INFO: $1"
}

log_success() {
    echo "✓ $1"
}

log_error() {
    echo "ERROR: $1" >&2
}

log_warning() {
    echo "WARNING: $1" >&2
}

# Cleanup function for temporary files
cleanup() {
    local exit_code=$?
    rm -f /tmp/agent_update_*_$$
    rm -f /tmp/manual_additions_$$
    exit $exit_code
}

# Set up cleanup trap
trap cleanup EXIT INT TERM

#==============================================================================
# Validation Functions
#==============================================================================

validate_environment() {
    # Check if we have a current branch/story (git or non-git)
    if [[ -z "$CURRENT_BRANCH" ]]; then
        log_error "Unable to determine current story"
        if [[ "$HAS_GIT" == "true" ]]; then
            log_info "Make sure you're on a story branch"
        else
            log_info "Set WORLDBUILD_STORY environment variable or create a story first"
        fi
        exit 1
    fi
    
    # Check if world.md exists
    if [[ ! -f "$WORLD_FILE_PATH" ]]; then
        log_error "No world.md found at $WORLD_FILE_PATH"
        log_info "Make sure you're working on a story with a corresponding world directory"
        if [[ "$HAS_GIT" != "true" ]]; then
            log_info "Use: export WORLDBUILD_STORY=your-story-name or create a new story first"
        fi
        exit 1
    fi
    
    # Check if template exists (needed for new files)
    if [[ ! -f "$TEMPLATE_FILE" ]]; then
        log_warning "Template file not found at $TEMPLATE_FILE"
        log_warning "Creating new agent files will fail"
    fi
}

#==============================================================================
# World Parsing Functions
#==============================================================================

extract_world_field() {
    local field_pattern="$1"
    local world_file="$2"
    
    grep "^\*\*${field_pattern}\*\*: " "$world_file" 2>/dev/null | \
        head -1 | \
        sed "s|^\*\*${field_pattern}\*\*: ||" | \
        sed 's/^[ \t]*//;s/[ \t]*$//' | \
        grep -v "NEEDS CLARIFICATION" | \
        grep -v "^N/A$" || echo ""
}

parse_world_data() {
    local world_file="$1"
    
    if [[ ! -f "$world_file" ]]; then
        log_error "World file not found: $world_file"
        return 1
    fi
    
    if [[ ! -r "$world_file" ]]; then
        log_error "World file is not readable: $world_file"
        return 1
    fi
    
    log_info "Parsing world data from $world_file"
    
    # Extract story information from world.md
    GENRE=$(extract_world_field "Genre" "$world_file")
    SETTING=$(extract_world_field "Setting" "$world_file")
    STORY_TYPE=$(extract_world_field "Story Type" "$world_file")
    PROTAGONIST=$(extract_world_field "Protagonist" "$world_file")
    
    # Log what we found
    if [[ -n "$GENRE" ]]; then
        log_info "Found genre: $GENRE"
    else
        log_warning "No genre information found in world"
    fi
    
    if [[ -n "$SETTING" ]]; then
        log_info "Found setting: $SETTING"
    fi
    
    if [[ -n "$STORY_TYPE" ]]; then
        log_info "Found story type: $STORY_TYPE"
    fi
    
    if [[ -n "$PROTAGONIST" ]]; then
        log_info "Found protagonist: $PROTAGONIST"
    fi
}

format_story_info() {
    local genre="$1"
    local setting="$2"
    local parts=()
    
    # Add non-empty parts
    [[ -n "$genre" && "$genre" != "NEEDS CLARIFICATION" ]] && parts+=("$genre")
    [[ -n "$setting" && "$setting" != "NEEDS CLARIFICATION" && "$setting" != "N/A" ]] && parts+=("$setting")
    
    # Join with proper formatting
    if [[ ${#parts[@]} -eq 0 ]]; then
        echo ""
    elif [[ ${#parts[@]} -eq 1 ]]; then
        echo "${parts[0]}"
    else
        # Join multiple parts with " - "
        local result="${parts[0]}"
        for ((i=1; i<${#parts[@]}; i++)); do
            result="$result - ${parts[i]}"
        done
        echo "$result"
    fi
}

#==============================================================================
# Template and Content Generation Functions
#==============================================================================

get_story_structure() {
    local story_type="$1"
    
    if [[ "$story_type" == *"series"* ]] || [[ "$story_type" == *"trilogy"* ]]; then
        echo "worlds/\\ncharacters/\\noutline.md\\nchapters.md"
    else
        echo "world.md\\noutline.md\\nchapters.md\\ncharacters/"
    fi
}

get_recommended_commands() {
    local genre="$1"
    
    case "$genre" in
        *"Fantasy"*|*"Sci-Fi"*|*"Science Fiction"*)
            echo "/worldkit.worldbuild → /worldkit.sensory → /worldkit.outline → /worldkit.chapters → /worldkit.write"
            ;;
        *"Mystery"*|*"Thriller"*)
            echo "/worldkit.worldbuild → /worldkit.outline → /worldkit.bible → /worldkit.write"
            ;;
        *"Romance"*)
            echo "/worldkit.worldbuild → /worldkit.character → /worldkit.outline → /worldkit.write"
            ;;
        *)
            echo "/worldkit.worldbuild → /worldkit.outline → /worldkit.chapters → /worldkit.write"
            ;;
    esac
}

get_story_conventions() {
    local genre="$1"
    echo "$genre: Follow genre conventions and reader expectations"
}

create_new_agent_file() {
    local target_file="$1"
    local temp_file="$2"
    local story_name="$3"
    local current_date="$4"
    
    if [[ ! -f "$TEMPLATE_FILE" ]]; then
        log_error "Template not found at $TEMPLATE_FILE"
        return 1
    fi
    
    if [[ ! -r "$TEMPLATE_FILE" ]]; then
        log_error "Template file is not readable: $TEMPLATE_FILE"
        return 1
    fi
    
    log_info "Creating new agent context file from template..."
    
    if ! cp "$TEMPLATE_FILE" "$temp_file"; then
        log_error "Failed to copy template file"
        return 1
    fi
    
    # Replace template placeholders with story information
    local story_structure
    story_structure=$(get_story_structure "$STORY_TYPE")
    
    local commands
    commands=$(get_recommended_commands "$GENRE")
    
    local story_conventions
    story_conventions=$(get_story_conventions "$GENRE")
    
    # Perform substitutions with error checking
    local escaped_genre=$(printf '%s\n' "$GENRE" | sed 's/[\[\.*^$()+{}|]/\\&/g')
    local escaped_setting=$(printf '%s\n' "$SETTING" | sed 's/[\[\.*^$()+{}|]/\\&/g')
    local escaped_branch=$(printf '%s\n' "$CURRENT_BRANCH" | sed 's/[\[\.*^$()+{}|]/\\&/g')
    
    # Build story info and recent change strings conditionally
    local story_info
    if [[ -n "$escaped_genre" && -n "$escaped_setting" ]]; then
        story_info="- $escaped_genre - $escaped_setting ($escaped_branch)"
    elif [[ -n "$escaped_genre" ]]; then
        story_info="- $escaped_genre ($escaped_branch)"
    elif [[ -n "$escaped_setting" ]]; then
        story_info="- $escaped_setting ($escaped_branch)"
    else
        story_info="- ($escaped_branch)"
    fi

    local recent_change
    if [[ -n "$escaped_genre" && -n "$escaped_setting" ]]; then
        recent_change="- $escaped_branch: Started $escaped_genre story in $escaped_setting"
    elif [[ -n "$escaped_genre" ]]; then
        recent_change="- $escaped_branch: Started $escaped_genre story"
    elif [[ -n "$escaped_setting" ]]; then
        recent_change="- $escaped_branch: Started story set in $escaped_setting"
    else
        recent_change="- $escaped_branch: Started new story"
    fi

    local substitutions=(
        "s|\[WORLD NAME\]|$story_name|"
        "s|\[DATE\]|$current_date|"
        "s|\[EXTRACTED FROM ALL OUTLINE.MD FILES\]|$story_info|"
        "s|\[ACTUAL STRUCTURE FROM OUTLINES\]|$story_structure|g"
        "s|\[ONLY COMMANDS RELEVANT TO CURRENT STORIES\]|$commands|"
        "s|\[GENRE-SPECIFIC, ONLY FOR GENRES IN USE\]|$story_conventions|"
        "s|\[LAST 3 STORIES AND WHAT THEY ADDED TO THE WORLD\]|$recent_change|"
    )
    
    for substitution in "${substitutions[@]}"; do
        if ! sed -i.bak -e "$substitution" "$temp_file"; then
            log_error "Failed to perform substitution: $substitution"
            rm -f "$temp_file" "$temp_file.bak"
            return 1
        fi
    done
    
    # Convert \n sequences to actual newlines
    newline=$(printf '\n')
    sed -i.bak2 "s/\\\\n/${newline}/g" "$temp_file"
    
    # Clean up backup files
    rm -f "$temp_file.bak" "$temp_file.bak2"
    
    return 0
}




update_existing_agent_file() {
    local target_file="$1"
    local current_date="$2"
    
    log_info "Updating existing agent context file..."
    
    # Use a single temporary file for atomic update
    local temp_file
    temp_file=$(mktemp) || {
        log_error "Failed to create temporary file"
        return 1
    }
    
    # Process the file in one pass
    local story_info=$(format_story_info "$GENRE" "$SETTING")
    local new_story_entries=()
    local new_change_entry=""
    
    # Prepare new story entries
    if [[ -n "$story_info" ]] && ! grep -q "$story_info" "$target_file"; then
        new_story_entries+=("- $story_info ($CURRENT_BRANCH)")
    fi
    
    if [[ -n "$PROTAGONIST" ]] && [[ "$PROTAGONIST" != "N/A" ]] && [[ "$PROTAGONIST" != "NEEDS CLARIFICATION" ]] && ! grep -q "$PROTAGONIST" "$target_file"; then
        new_story_entries+=("- Protagonist: $PROTAGONIST ($CURRENT_BRANCH)")
    fi
    
    # Prepare new change entry
    if [[ -n "$story_info" ]]; then
        new_change_entry="- $CURRENT_BRANCH: Working on $story_info"
    elif [[ -n "$PROTAGONIST" ]] && [[ "$PROTAGONIST" != "N/A" ]] && [[ "$PROTAGONIST" != "NEEDS CLARIFICATION" ]]; then
        new_change_entry="- $CURRENT_BRANCH: Developing $PROTAGONIST story"
    fi
    
    # Check if sections exist in the file
    local has_active_stories=0
    local has_recent_changes=0
    
    if grep -q "^## Active Stories" "$target_file" 2>/dev/null; then
        has_active_stories=1
    fi
    
    if grep -q "^## Recent Changes" "$target_file" 2>/dev/null; then
        has_recent_changes=1
    fi
    
    # Process file line by line
    local in_stories_section=false
    local in_changes_section=false
    local story_entries_added=false
    local changes_entries_added=false
    local existing_changes_count=0
    
    while IFS= read -r line || [[ -n "$line" ]]; do
        # Handle Active Stories section
        if [[ "$line" == "## Active Stories" ]]; then
            echo "$line" >> "$temp_file"
            in_stories_section=true
            continue
        elif [[ $in_stories_section == true ]] && [[ "$line" =~ ^##[[:space:]] ]]; then
            # Add new story entries before closing the section
            if [[ $story_entries_added == false ]] && [[ ${#new_story_entries[@]} -gt 0 ]]; then
                printf '%s\n' "${new_story_entries[@]}" >> "$temp_file"
                story_entries_added=true
            fi
            echo "$line" >> "$temp_file"
            in_stories_section=false
            continue
        elif [[ $in_stories_section == true ]] && [[ -z "$line" ]]; then
            # Add new story entries before empty line in stories section
            if [[ $story_entries_added == false ]] && [[ ${#new_story_entries[@]} -gt 0 ]]; then
                printf '%s\n' "${new_story_entries[@]}" >> "$temp_file"
                story_entries_added=true
            fi
            echo "$line" >> "$temp_file"
            continue
        fi
        
        # Handle Recent Changes section
        if [[ "$line" == "## Recent Changes" ]]; then
            echo "$line" >> "$temp_file"
            # Add new change entry right after the heading
            if [[ -n "$new_change_entry" ]]; then
                echo "$new_change_entry" >> "$temp_file"
            fi
            in_changes_section=true
            changes_entries_added=true
            continue
        elif [[ $in_changes_section == true ]] && [[ "$line" =~ ^##[[:space:]] ]]; then
            echo "$line" >> "$temp_file"
            in_changes_section=false
            continue
        elif [[ $in_changes_section == true ]] && [[ "$line" == "- "* ]]; then
            # Keep only first 2 existing changes
            if [[ $existing_changes_count -lt 2 ]]; then
                echo "$line" >> "$temp_file"
                ((existing_changes_count++))
            fi
            continue
        fi
        
        # Update timestamp
        if [[ "$line" =~ \*\*Last\ updated\*\*:.*[0-9][0-9][0-9][0-9]-[0-9][0-9]-[0-9][0-9] ]]; then
            echo "$line" | sed "s/[0-9][0-9][0-9][0-9]-[0-9][0-9]-[0-9][0-9]/$current_date/" >> "$temp_file"
        else
            echo "$line" >> "$temp_file"
        fi
    done < "$target_file"
    
    # Post-loop check: if we're still in the Active Stories section and haven't added new entries
    if [[ $in_stories_section == true ]] && [[ $story_entries_added == false ]] && [[ ${#new_story_entries[@]} -gt 0 ]]; then
        printf '%s\n' "${new_story_entries[@]}" >> "$temp_file"
        story_entries_added=true
    fi
    
    # If sections don't exist, add them at the end of the file
    if [[ $has_active_stories -eq 0 ]] && [[ ${#new_story_entries[@]} -gt 0 ]]; then
        echo "" >> "$temp_file"
        echo "## Active Stories" >> "$temp_file"
        printf '%s\n' "${new_story_entries[@]}" >> "$temp_file"
        story_entries_added=true
    fi
    
    if [[ $has_recent_changes -eq 0 ]] && [[ -n "$new_change_entry" ]]; then
        echo "" >> "$temp_file"
        echo "## Recent Changes" >> "$temp_file"
        echo "$new_change_entry" >> "$temp_file"
        changes_entries_added=true
    fi
    
    # Move temp file to target atomically
    if ! mv "$temp_file" "$target_file"; then
        log_error "Failed to update target file"
        rm -f "$temp_file"
        return 1
    fi
    
    return 0
}
#==============================================================================
# Main Agent File Update Function
#==============================================================================

update_agent_file() {
    local target_file="$1"
    local agent_name="$2"
    
    if [[ -z "$target_file" ]] || [[ -z "$agent_name" ]]; then
        log_error "update_agent_file requires target_file and agent_name parameters"
        return 1
    fi
    
    log_info "Updating $agent_name context file: $target_file"
    
    local story_name
    story_name=$(basename "$REPO_ROOT")
    local current_date
    current_date=$(date +%Y-%m-%d)
    
    # Create directory if it doesn't exist
    local target_dir
    target_dir=$(dirname "$target_file")
    if [[ ! -d "$target_dir" ]]; then
        if ! mkdir -p "$target_dir"; then
            log_error "Failed to create directory: $target_dir"
            return 1
        fi
    fi
    
    if [[ ! -f "$target_file" ]]; then
        # Create new file from template
        local temp_file
        temp_file=$(mktemp) || {
            log_error "Failed to create temporary file"
            return 1
        }
        
        if create_new_agent_file "$target_file" "$temp_file" "$story_name" "$current_date"; then
            if mv "$temp_file" "$target_file"; then
                log_success "Created new $agent_name context file"
            else
                log_error "Failed to move temporary file to $target_file"
                rm -f "$temp_file"
                return 1
            fi
        else
            log_error "Failed to create new agent file"
            rm -f "$temp_file"
            return 1
        fi
    else
        # Update existing file
        if [[ ! -r "$target_file" ]]; then
            log_error "Cannot read existing file: $target_file"
            return 1
        fi
        
        if [[ ! -w "$target_file" ]]; then
            log_error "Cannot write to existing file: $target_file"
            return 1
        fi
        
        if update_existing_agent_file "$target_file" "$current_date"; then
            log_success "Updated existing $agent_name context file"
        else
            log_error "Failed to update existing agent file"
            return 1
        fi
    fi
    
    return 0
}

#==============================================================================
# Agent Selection and Processing
#==============================================================================

update_specific_agent() {
    local agent_type="$1"
    
    case "$agent_type" in
        claude)
            update_agent_file "$CLAUDE_FILE" "Claude Code"
            ;;
        gemini)
            update_agent_file "$GEMINI_FILE" "Gemini CLI"
            ;;
        copilot)
            update_agent_file "$COPILOT_FILE" "GitHub Copilot"
            ;;
        cursor-agent)
            update_agent_file "$CURSOR_FILE" "Cursor IDE"
            ;;
        qwen)
            update_agent_file "$QWEN_FILE" "Qwen Code"
            ;;
        opencode)
            update_agent_file "$AGENTS_FILE" "opencode"
            ;;
        codex)
            update_agent_file "$AGENTS_FILE" "Codex CLI"
            ;;
        windsurf)
            update_agent_file "$WINDSURF_FILE" "Windsurf"
            ;;
        kilocode)
            update_agent_file "$KILOCODE_FILE" "Kilo Code"
            ;;
        auggie)
            update_agent_file "$AUGGIE_FILE" "Auggie CLI"
            ;;
        roo)
            update_agent_file "$ROO_FILE" "Roo Code"
            ;;
        codebuddy)
            update_agent_file "$CODEBUDDY_FILE" "CodeBuddy CLI"
            ;;
        amp)
            update_agent_file "$AMP_FILE" "Amp"
            ;;
        q)
            update_agent_file "$Q_FILE" "Amazon Q Developer CLI"
            ;;
        *)
            log_error "Unknown agent type '$agent_type'"
            log_error "Expected: claude|gemini|copilot|cursor-agent|qwen|opencode|codex|windsurf|kilocode|auggie|roo|amp|q"
            exit 1
            ;;
    esac
}

update_all_existing_agents() {
    local found_agent=false
    
    # Check each possible agent file and update if it exists
    if [[ -f "$CLAUDE_FILE" ]]; then
        update_agent_file "$CLAUDE_FILE" "Claude Code"
        found_agent=true
    fi
    
    if [[ -f "$GEMINI_FILE" ]]; then
        update_agent_file "$GEMINI_FILE" "Gemini CLI"
        found_agent=true
    fi
    
    if [[ -f "$COPILOT_FILE" ]]; then
        update_agent_file "$COPILOT_FILE" "GitHub Copilot"
        found_agent=true
    fi
    
    if [[ -f "$CURSOR_FILE" ]]; then
        update_agent_file "$CURSOR_FILE" "Cursor IDE"
        found_agent=true
    fi
    
    if [[ -f "$QWEN_FILE" ]]; then
        update_agent_file "$QWEN_FILE" "Qwen Code"
        found_agent=true
    fi
    
    if [[ -f "$AGENTS_FILE" ]]; then
        update_agent_file "$AGENTS_FILE" "Codex/opencode"
        found_agent=true
    fi
    
    if [[ -f "$WINDSURF_FILE" ]]; then
        update_agent_file "$WINDSURF_FILE" "Windsurf"
        found_agent=true
    fi
    
    if [[ -f "$KILOCODE_FILE" ]]; then
        update_agent_file "$KILOCODE_FILE" "Kilo Code"
        found_agent=true
    fi

    if [[ -f "$AUGGIE_FILE" ]]; then
        update_agent_file "$AUGGIE_FILE" "Auggie CLI"
        found_agent=true
    fi
    
    if [[ -f "$ROO_FILE" ]]; then
        update_agent_file "$ROO_FILE" "Roo Code"
        found_agent=true
    fi

    if [[ -f "$CODEBUDDY_FILE" ]]; then
        update_agent_file "$CODEBUDDY_FILE" "CodeBuddy CLI"
        found_agent=true
    fi

    if [[ -f "$Q_FILE" ]]; then
        update_agent_file "$Q_FILE" "Amazon Q Developer CLI"
        found_agent=true
    fi
    
    # If no agent files exist, create a default Claude file
    if [[ "$found_agent" == false ]]; then
        log_info "No existing agent files found, creating default Claude file..."
        update_agent_file "$CLAUDE_FILE" "Claude Code"
    fi
}
print_summary() {
    echo
    log_info "Summary of changes:"
    
    if [[ -n "$NEW_GENRE" ]]; then
        echo "  - Working on genre: $NEW_GENRE"
    fi
    
    if [[ -n "$NEW_SETTING" ]]; then
        echo "  - Working on setting: $NEW_SETTING"
    fi
    
    if [[ -n "$NEW_PROTAGONIST" ]] && [[ "$NEW_PROTAGONIST" != "N/A" ]]; then
        echo "  - Working on protagonist: $NEW_PROTAGONIST"
    fi
    
    echo

    log_info "Usage: $0 [claude|gemini|copilot|cursor-agent|qwen|opencode|codex|windsurf|kilocode|auggie|codebuddy|q]"
}

#==============================================================================
# Main Execution
#==============================================================================

main() {
    # Validate environment before proceeding
    validate_environment
    
    log_info "=== Updating agent context files for story $CURRENT_BRANCH ==="
    
    # Parse the world file to extract story information
    if ! parse_world_data "$NEW_WORLD"; then
        log_error "Failed to parse world data"
        exit 1
    fi
    
    # Process based on agent type argument
    local success=true
    
    if [[ -z "$AGENT_TYPE" ]]; then
        # No specific agent provided - update all existing agent files
        log_info "No agent specified, updating all existing agent files..."
        if ! update_all_existing_agents; then
            success=false
        fi
    else
        # Specific agent provided - update only that agent
        log_info "Updating specific agent: $AGENT_TYPE"
        if ! update_specific_agent "$AGENT_TYPE"; then
            success=false
        fi
    fi
    
    # Print summary
    print_summary
    
    if [[ "$success" == true ]]; then
        log_success "Agent context update completed successfully"
        exit 0
    else
        log_error "Agent context update completed with errors"
        exit 1
    fi
}

# Execute main function if script is run directly
if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    main "$@"
fi

