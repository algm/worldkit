---
description: Create or update the world and story description from a natural language input.
scripts:
  sh: scripts/bash/create-new-feature.sh --json "{ARGS}"
  ps: scripts/powershell/create-new-feature.ps1 -Json "{ARGS}"
---

## User Input

```text
$ARGUMENTS
```

You **MUST** consider the user input before proceeding (if not empty).

## Output Language Configuration

Before proceeding, check for language configuration:

1. **Load language preference** from `/memory/config.json`:
   - If the file exists and contains a `language` field, use that language for all generated outputs
   - Language codes: `en` (English), `es` (Spanish), `fr` (French), `de` (German), `pt` (Portuguese), `ja` (Japanese), `zh` (Chinese), etc.
   - Default to English if no configuration is found

2. **Apply language to outputs**:
   - Write all world descriptions, character profiles, settings, and narrative content in the configured language
   - Keep technical markers and section headers in English for consistency (e.g., `[NEEDS EXPANSION]`, file paths)
   - Maintain the template structure while translating the content

## Outline

The text the user typed after `/worldkit.worldbuild` in the triggering message **is** the world/story description. Assume you always have it available in this conversation even if `{ARGS}` appears literally below. Do not ask the user to repeat it unless they provided an empty command.

Given that world/story description, do this:

1. **Generate a concise short name** (2-4 words) for the branch:
   - Analyze the world/story description and extract the most meaningful keywords
   - Create a 2-4 word short name that captures the essence of the story or world
   - Use descriptive format that evokes the setting or main conflict
   - Examples:
     - "A fantasy world where magic is dying" → "dying-magic"
     - "Space opera about interstellar rebellion" → "interstellar-rebellion"
     - "Mystery set in Victorian London" → "victorian-mystery"
     - "Post-apocalyptic survival story" → "post-apocalypse-survival"

2. **Check for existing branches before creating new one**:
   
   a. First, fetch all remote branches to ensure we have the latest information:
      ```bash
      git fetch --all --prune
      ```
   
   b. Find the highest story number across all sources for the short-name:
      - Remote branches: `git ls-remote --heads origin | grep -E 'refs/heads/[0-9]+-<short-name>$'`
      - Local branches: `git branch | grep -E '^[* ]*[0-9]+-<short-name>$'`
      - Worlds directories: Check for directories matching `worlds/[0-9]+-<short-name>`
   
   c. Determine the next available number:
      - Extract all numbers from all three sources
      - Find the highest number N
      - Use N+1 for the new branch number
   
   d. Run the script `{SCRIPT}` with the calculated number and short-name:
      - Pass `--number N+1` and `--short-name "your-short-name"` along with the world description
      - Bash example: `{SCRIPT} --json --number 3 --short-name "dying-magic" "A fantasy world where magic is dying"`
      - PowerShell example: `{SCRIPT} -Json -Number 3 -ShortName "dying-magic" "A fantasy world where magic is dying"`
   
   **IMPORTANT**:
   - Check all three sources (remote branches, local branches, worlds directories) to find the highest number
   - Only match branches/directories with the exact short-name pattern
   - If no existing branches/directories found with this short-name, start with number 1
   - You must only ever run this script once per story/world
   - The JSON is provided in the terminal as output - always refer to it to get the actual content you're looking for
   - The JSON output will contain BRANCH_NAME and WORLD_FILE paths
   - For single quotes in args like "I'm writing", use escape syntax: e.g 'I'\''m writing' (or double-quote if possible: "I'm writing")

3. Load `templates/world-template.md` to understand required sections.

4. Follow this execution flow:

   1. Parse user description from Input
      If empty: ERROR "No world/story description provided"
   2. Extract key concepts from description
      Identify: characters, setting, conflicts, themes, world rules
   3. For unclear aspects:
      - Make informed guesses based on genre conventions and storytelling standards
      - Only mark with [NEEDS EXPANSION: specific question] if:
        - The choice significantly impacts story scope or character development
        - Multiple reasonable interpretations exist with different implications
        - No reasonable default exists for the genre/style
      - **LIMIT: Maximum 3 [NEEDS EXPANSION] markers total**
      - Prioritize expansions by impact: core conflict > main characters > setting > themes
   4. Fill Character Profiles section
      If no clear characters: ERROR "Cannot determine main characters"
   5. Generate World Elements
      Each element must be consistent with the foundation
      Use genre conventions for unspecified details (document assumptions in Assumptions section)
   6. Define Story Goals
      Create measurable, narrative-focused outcomes
      Include both plot milestones (acts, turning points) and thematic goals (character growth, message)
      Each goal must be verifiable in the finished story
   7. Identify Key Conflicts (if applicable)
   8. Return: SUCCESS (world ready for outlining)

5. Write the world description to WORLD_FILE using the template structure, replacing placeholders with concrete details derived from the user's description while preserving section order and headings.

6. **World Quality Validation**: After writing the initial world description, validate it against quality criteria:

   a. **Create World Quality Checklist**: Generate a checklist file at `STORY_DIR/checklists/world-quality.md` with validation items:

      ```markdown
      # World Quality Checklist: [STORY NAME]
      
      **Purpose**: Validate world description completeness and quality before proceeding to outlining
      **Created**: [DATE]
      **Story**: [Link to world.md]
      
      ## Content Quality
      
      - [ ] Genre and tone clearly established
      - [ ] Written with engaging narrative voice
      - [ ] Focused on story elements and character arcs
      - [ ] All mandatory sections completed
      
      ## Element Completeness
      
      - [ ] No [NEEDS EXPANSION] markers remain
      - [ ] Characters have clear motivations and flaws
      - [ ] Setting is vivid and consistent
      - [ ] Central conflict is compelling and clear
      - [ ] World rules are defined and logical
      - [ ] Themes are identifiable
      - [ ] Scope is manageable for intended format
      
      ## Story Readiness
      
      - [ ] Main character arcs are outlined
      - [ ] Supporting characters serve clear purposes
      - [ ] World elements support the story (not just decoration)
      - [ ] Conflicts have potential for dramatic tension
      - [ ] Story goals align with genre expectations
      
      ## Notes
      
      - Items marked incomplete require world updates before `/worldkit.expand` or `/worldkit.outline`
      ```

   b. **Run Validation Check**: Review the world description against each checklist item:
      - For each item, determine if it passes or fails
      - Document specific issues found (quote relevant sections)

   c. **Handle Validation Results**:

      - **If all items pass**: Mark checklist complete and proceed

      - **If items fail (excluding [NEEDS EXPANSION])**:
        1. List the failing items and specific issues
        2. Update the world description to address each issue
        3. Re-run validation until all items pass (max 3 iterations)
        4. If still failing after 3 iterations, document remaining issues in checklist notes and warn user

      - **If [NEEDS EXPANSION] markers remain**:
        1. Document them in the checklist
        2. Inform user they can use `/worldkit.expand` to address them
        3. Continue with world creation (expansion is optional)

   d. **Generate Final Checklist**: Save the checklist file with all validation results

7. **Final Output**: Report to user:
   - Branch name created
   - Path to world.md file
   - Summary of validation status
   - Next recommended command (`/worldkit.expand` if needed, otherwise `/worldkit.outline`)

## Error Handling

- **Empty Input**: Request user provide world/story description
- **Script Failure**: Show script error and suggest manual branch creation
- **Validation Failures**: List specific issues and offer to fix or continue
- **Template Missing**: Error with path to expected template location

## Success Criteria

- World description file created with all required sections filled
- Quality checklist generated and validated
- User informed of next steps
- Branch and directory structure properly initialized
