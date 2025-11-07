---
description: Execute the story outlining workflow using the outline template to generate plot structure.
scripts:
  sh: scripts/bash/setup-plan.sh --json
  ps: scripts/powershell/setup-plan.ps1 -Json
agent_scripts:
  sh: scripts/bash/update-agent-context.sh __AGENT__
  ps: scripts/powershell/update-agent-context.ps1 -AgentType __AGENT__
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
   - Write all story outlines, plot descriptions, character arcs, and narrative planning in the configured language
   - Keep technical markers and section headers in English for consistency (e.g., file paths, `Phase 0`, `Phase 1`)
   - Maintain the template structure while translating the content

## Outline

1. **Setup**: Run `{SCRIPT}` from repo root and parse JSON for WORLD_FILE, STORY_OUTLINE, WORLDS_DIR, BRANCH. For single quotes in args like "I'm writing", use escape syntax: e.g 'I'\''m writing' (or double-quote if possible: "I'm writing").

2. **Load context**: Read WORLD_FILE and `/memory/foundation.md`. Load STORY_OUTLINE template (already copied).

3. **Execute outline workflow**: Follow the structure in STORY_OUTLINE template to:
   - Fill Story Structure Type (choose appropriate narrative structure)
   - Fill Foundation Check section from foundation
   - Evaluate consistency (ERROR if violations unjustified)
   - Phase 0: Generate research.md (resolve all NEEDS EXPANSION)
   - Phase 1: Generate character-arcs.md, plot-beats.md
   - Phase 1: Update agent context by running the agent script
   - Re-evaluate Foundation Check post-outline

4. **Stop and report**: Command ends after Phase 2 outlining. Report branch, STORY_OUTLINE path, and generated artifacts.

## Phases

### Phase 0: Research & Expansion

1. **Extract unknowns from Story Context**:
   - For each NEEDS EXPANSION → research task
   - For each setting detail → reference research task
   - For each character background → depth research task

2. **Generate and dispatch research agents**:

   ```text
   For each unknown in Story Context:
     Task: "Research {unknown} for {story context}"
   For each genre element:
     Task: "Find conventions for {genre} in {aspect}"
   For each historical/technical detail:
     Task: "Research {detail} for authenticity"
   ```

3. **Consolidate findings** in `research.md` using format:
   - Decision: [what was chosen]
   - Rationale: [why chosen]
   - Sources: [research sources consulted]
   - Alternatives considered: [what else was evaluated]

**Output**: research.md with all NEEDS EXPANSION resolved

### Phase 1: Structure & Arcs

**Prerequisites:** `research.md` complete

1. **Extract character arcs from world description** → `character-arcs.md`:
   - Character starting point
   - Growth trajectory
   - Key transformation moments
   - Ending state

2. **Generate plot beats** from story outline:
   - For each act → major plot points
   - Use chosen narrative structure (Three-Act, Hero's Journey, etc.)
   - Output detailed beat sheet to `plot-beats.md`

3. **Agent context update**:
   - Run `{AGENT_SCRIPT}`
   - These scripts detect which AI agent is in use
   - Update the appropriate agent-specific context file
   - Add genre conventions and story elements from current outline
   - Preserve manual additions between markers

**Output**: character-arcs.md, plot-beats.md, agent-specific file

## Key Rules

- Use absolute paths
- ERROR on consistency failures or unresolved expansions
- Respect established foundation elements
- Maintain genre conventions
