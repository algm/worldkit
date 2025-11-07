---
description: Generate quality checklists to validate story completeness, clarity, and consistency.
---

## User Input

```text
$ARGUMENTS
```

You **MUST** consider the user input before proceeding (if not empty).

## Output Language Configuration

Before proceeding, check for language configuration:

1. **Load language preference** from `/memory/config.json`:
   - If the file exists and contains a `language` field, use that language for checklist content
   - Language codes: `en` (English), `es` (Spanish), `fr` (French), `de` (German), `pt` (Portuguese), `ja` (Japanese), `zh` (Chinese), etc.
   - Default to English if no configuration is found

2. **Apply language to outputs**:
   - Write checklist items, descriptions, and notes in the configured language
   - Keep technical markers in English for consistency (e.g., `- [ ]`, file paths)
   - Maintain checklist structure while translating the content

## Goal

Generate custom quality checklists that serve as "unit tests for your story elements"—validating that characters, plots, settings, and themes meet quality standards before writing.

## When to Use

Run after `/worldkit.outline` to generate checklists for validating story quality before breaking into chapters or starting to write.

## Checklist Types

### 1. Character Quality Checklist

Validates each major character:
- [ ] Has clear, specific motivation
- [ ] Possesses distinguishing flaw or weakness
- [ ] Has meaningful character arc potential
- [ ] Takes actions that advance plot
- [ ] Speaks with distinctive voice
- [ ] Has relationships that create conflict/growth
- [ ] Background explains current behavior
- [ ] Not a stereotype or cliché
- [ ] Serves clear narrative purpose

### 2. Plot Structure Checklist

Validates story structure:
- [ ] Opening hooks reader effectively
- [ ] Inciting incident disrupts status quo
- [ ] First act establishes world and stakes
- [ ] Rising action increases tension
- [ ] Midpoint provides significant reversal
- [ ] Dark moment feels earned
- [ ] Climax resolves central conflict
- [ ] All setups have payoffs
- [ ] Subplots enhance main story
- [ ] Ending resonates emotionally

### 3. Setting & World Building Checklist

Validates world consistency:
- [ ] Setting is vivid and specific
- [ ] World rules are clear and consistent
- [ ] Magic/technology has defined limits
- [ ] Geography makes logical sense
- [ ] Culture is internally consistent
- [ ] History shapes present events
- [ ] Sensory details immerse reader
- [ ] World serves story (not just decoration)
- [ ] Foundation rules respected (if applicable)

### 4. Theme & Meaning Checklist

Validates thematic depth:
- [ ] Theme is identifiable but not preachy
- [ ] Multiple scenes explore theme
- [ ] Characters embody different perspectives
- [ ] Conflict tests thematic question
- [ ] Subplots reinforce theme
- [ ] Resolution addresses thematic question
- [ ] Message emerges naturally from story
- [ ] Theme appropriate for genre/audience

### 5. Pacing & Tension Checklist

Validates narrative flow:
- [ ] Story opens with momentum
- [ ] Tension builds progressively
- [ ] Quiet moments follow intense scenes
- [ ] Each scene advances plot or character
- [ ] Middle doesn't sag
- [ ] Climax arrives at right moment
- [ ] Pacing appropriate for genre
- [ ] Chapter breaks create desire to continue

### 6. Continuity Checklist

Validates internal consistency:
- [ ] Character names/descriptions consistent
- [ ] Timeline makes sense
- [ ] Geography doesn't contradict itself
- [ ] Character knowledge tracks logically
- [ ] Technology/magic use consistent
- [ ] No plot holes
- [ ] Character actions align with motivations
- [ ] Foundation rules never broken

### 7. Genre Convention Checklist

Validates genre alignment:
- [ ] Story fits stated genre
- [ ] Tone is consistent
- [ ] Tropes used intentionally
- [ ] Reader expectations addressed
- [ ] Length appropriate for format
- [ ] Pacing matches genre norms
- [ ] Ending satisfies genre requirements

## Execution Steps

### 1. Load Context

- Read world.md for story elements
- Read outline.md for structure
- Read foundation.md if exists
- Note stated genre and target audience

### 2. Generate Custom Checklist

Based on story specifics, create a custom checklist document at `STORY_DIR/checklists/story-quality.md`:

```markdown
# Story Quality Checklist: [STORY NAME]

**Date**: [Date]
**Genre**: [Genre]
**Stage**: Pre-Writing Validation

## Instructions

Review each item below. Check off items that pass validation.
For items that fail, note specific issues in the Issues section.

---

## Character Quality

### Protagonist: [Name]

- [ ] Has specific, compelling motivation
- [ ] Possesses meaningful flaw
- [ ] Arc shows potential for growth
- [ ] Actions drive the plot
- [ ] Voice is distinctive
- **Issues**: [Note any problems]

### Antagonist: [Name]

- [ ] Has understandable motivation
- [ ] Provides worthy opposition
- [ ] More than one-dimensional villain
- [ ] Actions escalate conflict
- **Issues**: [Note any problems]

### Supporting Characters

[For each supporting character]:
- [ ] Serves clear narrative purpose
- [ ] Has distinct personality
- [ ] Relationships create conflict/depth
- **Issues**: [Note any problems]

---

## Plot Structure

### Act I
- [ ] Opening hooks reader
- [ ] World established quickly
- [ ] Inciting incident clear
- [ ] First plot point propels story
- **Issues**: [Note any problems]

### Act II
- [ ] Rising action increases tension
- [ ] Midpoint provides reversal
- [ ] Dark moment feels earned
- [ ] Second plot point leads to climax
- **Issues**: [Note any problems]

### Act III
- [ ] Climax resolves central conflict
- [ ] Character arcs complete
- [ ] Ending resonates emotionally
- [ ] Loose ends addressed
- **Issues**: [Note any problems]

---

## Setting & World

- [ ] Setting is vivid and specific
- [ ] World rules are consistent
- [ ] Geography makes sense
- [ ] Culture is well-defined
- [ ] Foundation rules respected
- **Issues**: [Note any problems]

---

## Theme & Meaning

- [ ] Theme is identifiable
- [ ] Explored through multiple scenes
- [ ] Not preachy or heavy-handed
- [ ] Resolution addresses theme
- **Issues**: [Note any problems]

---

## Pacing & Flow

- [ ] Opening has momentum
- [ ] Tension builds appropriately
- [ ] Middle doesn't sag
- [ ] Climax well-timed
- [ ] Pacing fits genre
- **Issues**: [Note any problems]

---

## Continuity

- [ ] Character details consistent
- [ ] Timeline coherent
- [ ] Geography doesn't contradict
- [ ] No plot holes identified
- [ ] Magic/technology use consistent
- **Issues**: [Note any problems]

---

## Genre Conventions

- [ ] Story fits stated genre
- [ ] Tone is consistent
- [ ] Tropes used intentionally
- [ ] Length appropriate
- [ ] Expectations addressed
- **Issues**: [Note any problems]

---

## Overall Assessment

**Total Items**: [X]
**Items Passed**: [Y]
**Completion**: [Y/X * 100]%

**Critical Issues**: [Count of must-fix problems]
**Major Issues**: [Count of should-fix problems]
**Minor Issues**: [Count of optional fixes]

---

## Action Items

1. [Priority 1 fix]
2. [Priority 2 fix]
3. [Priority 3 fix]

---

## Sign-Off

- [ ] All critical issues resolved
- [ ] Story ready for chapter breakdown
- [ ] Story ready for writing
- [ ] Checklist reviewed by: [Name]
- [ ] Date: [Date]

---

## Notes

[Additional observations, concerns, or reminders]
```

### 3. Walk Through Checklist

For each item:
- Evaluate against story documents
- Mark pass/fail
- Note specific issues found
- Suggest fixes where appropriate

### 4. Generate Report

Provide summary:
- Overall completion percentage
- Critical issues requiring fixes
- Major issues to consider
- Strengths identified

### 5. Present to User

Show:
- Checklist location
- Top issues found
- Overall readiness assessment
- Recommended next steps

## Customization

Checklists should adapt based on:
- **Genre**: Fantasy needs magic system checks, mystery needs clue tracking
- **Length**: Novel vs short story have different requirements
- **Stage**: Pre-outline vs pre-writing checks differ
- **User Request**: Add custom validation items

## Error Handling

- **Missing Documents**: Identify prerequisites
- **Incomplete Story**: Flag sections needing work
- **Ambiguous Items**: Ask for clarification

## Success Criteria

- Custom checklist generated
- All major story elements validated
- Specific issues identified
- Clear action items provided
- User knows what to fix before proceeding

## Notes

Checklists act as quality gates, catching problems early. They're most useful for longer works where consistency and depth matter. For short stories or exploratory drafts, a lighter touch may be appropriate.
