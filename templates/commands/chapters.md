---
description: Generate chapter and scene breakdown from the story outline.
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
   - Write all chapter summaries, scene descriptions, and narrative planning in the configured language
   - Keep technical markers and section headers in English for consistency (e.g., `Chapter 1`, `Scene 1`, file paths)
   - Maintain the template structure while translating the content

## Outline

1. **Prerequisites Check**:
   - Verify `world.md` exists and is complete
   - Verify `outline.md` exists and is complete
   - Verify foundation file exists (if applicable)
   - ERROR if any prerequisite missing

2. **Load Context**:
   - Read world.md for characters, settings, conflicts
   - Read outline.md for plot structure
   - Read foundation.md for world rules (if exists)
   - Read character-arcs.md and plot-beats.md (if exist)

3. **Generate Chapter Breakdown**:
   - Use the chapters-template.md structure
   - Break outline into chapters following the act structure
   - For each chapter:
     * Determine POV character
     * Identify location
     * Estimate word count
     * Define chapter purpose
     * Break into scenes with Goal-Conflict-Outcome structure
     * Create chapter end hook

4. **Scene Detailing**:
   - Each scene must have:
     * Clear goal (what character wants)
     * Specific conflict (what opposes the goal)
     * Definite outcome (how scene resolves)
     * Narrative purpose (plot advancement or character development)
   
   - Scene types to consider:
     * Action scenes
     * Dialogue scenes
     * Character development moments
     * World building reveals
     * Transition scenes

5. **Pacing Analysis**:
   - Visualize tension curve across chapters
   - Identify breather moments between intense scenes
   - Ensure climax positioning is appropriate
   - Balance action, dialogue, and reflection

6. **Writing Order Recommendations**:
   - Suggest optimal writing sequence
   - Identify chapters that can be drafted in parallel
   - Note chapters that depend on others being written first
   - Flag any that require additional research before writing

7. **Validation**:
   - Verify all plot beats from outline are covered
   - Check character arcs track through chapters
   - Ensure foundation rules are respected
   - Confirm pacing feels appropriate for genre
   - Validate that each chapter has clear purpose

8. **Output**:
   - Generate `chapters.md` with complete breakdown
   - Include word count targets and tracking table
   - Add POV distribution summary
   - Include writing order recommendations
   - Add research checklist if needed

## Scene Structure Best Practices

**Goal-Conflict-Outcome Pattern**:
- **Goal**: Character wants something specific in this scene
- **Conflict**: Something or someone prevents them from achieving it
- **Outcome**: Scene ends with success, failure, or complication that leads to next scene

**Scene Transitions**:
- Each scene should connect logically to the next
- Chapter ends should create desire to continue reading
- Use cliffhangers, questions, or emotional beats strategically

**Pacing Variation**:
- Mix scene lengths and intensities
- Follow intense scenes with reflection or quieter moments
- Build tension progressively toward climax

## Chapter Breakdown Rules

1. **Act I (Setup)** - approximately 20-25% of total chapters:
   - Introduction of world and characters
   - Establishment of normal life
   - Inciting incident
   - First plot point/call to adventure

2. **Act II (Confrontation)** - approximately 50-60% of total chapters:
   - Part 1: Rising action and complications
   - Midpoint: Major reversal or revelation
   - Part 2: Darkest moment and decision to act

3. **Act III (Resolution)** - approximately 15-25% of total chapters:
   - Preparation for climax
   - Climactic confrontation
   - Falling action
   - Denouement/new normal

## Word Count Guidelines by Format

**Novel**:
- Total: 70,000-120,000 words
- Chapters: 2,000-5,000 words each
- Scenes: 500-2,500 words each

**Novella**:
- Total: 20,000-50,000 words
- Chapters: 1,500-3,000 words each
- Scenes: 400-1,500 words each

**Short Story**:
- Total: 1,000-7,500 words
- Scenes: 250-2,000 words each
- May not have formal chapters

## Error Handling

- **Missing Prerequisites**: List what's needed before proceeding
- **Incomplete Outline**: Identify gaps in story structure
- **Inconsistent Foundation**: Point out contradictions with established rules
- **Pacing Issues**: Suggest adjustments to chapter distribution

## Success Criteria

- All plot points from outline have corresponding scenes
- Each chapter serves clear narrative purpose
- Scenes follow Goal-Conflict-Outcome structure
- Pacing appropriate for genre and story type
- POV strategy is consistent
- Word count targets are realistic
- Writing order is logical and efficient
