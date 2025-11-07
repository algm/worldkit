---
description: Execute the writing process based on chapter breakdown.
---

## User Input

```text
$ARGUMENTS
```

You **MUST** consider the user input before proceeding (if not empty).

## Output Language Configuration

Before proceeding, check for language configuration:

1. **Load language preference** from `/memory/config.json`:
   - If the file exists and contains a `language` field, use that language for all written content
   - Language codes: `en` (English), `es` (Spanish), `fr` (French), `de` (German), `pt` (Portuguese), `ja` (Japanese), `zh` (Chinese), etc.
   - Default to English if no configuration is found

2. **Apply language to writing**:
   - Write all narrative content, dialogue, descriptions, and prose in the configured language
   - Maintain natural, fluent writing appropriate to the target language and its literary conventions
   - Keep technical markers in English for consistency (e.g., scene markers, tracking notes)

## Outline

1. **Prerequisites Check**:
   - Verify `world.md` exists and is complete
   - Verify `outline.md` exists and is complete
   - Verify `chapters.md` exists with detailed scene breakdown
   - Verify foundation file (if applicable)
   - ERROR if any prerequisite missing

2. **Load Context**:
   - Read world.md for characters, settings, world rules
   - Read outline.md for overall story structure
   - Read chapters.md for scene-by-scene breakdown
   - Read foundation.md for world constraints (if exists)
   - Read character-arcs.md for character development tracking
   - Note writing order recommendations from chapters.md

3. **Determine Writing Approach**:
   
   **Option A - Sequential Writing** (Default):
   - Write chapters in story order
   - Good for maintaining flow and continuity
   - Best for linear narratives
   
   **Option B - Recommended Order**:
   - Follow writing order from chapters.md
   - Write key scenes first (climax, turning points)
   - Fill in connecting scenes afterward
   - Good for complex stories
   
   **Option C - Character-Focused**:
   - Write all scenes for one POV character first
   - Ensures voice consistency
   - Good for multi-POV stories

4. **Scene Writing Process**:
   
   For each scene in the chapter:
   
   a. **Review Scene Details**:
      - Goal: What character wants
      - Conflict: What opposes them
      - Outcome: How scene resolves
      - Type: Action, dialogue, reflection, etc.
   
   b. **Draft the Scene**:
      - Start with strong opening line/paragraph
      - Show, don't tell (use action and dialogue over narration)
      - Maintain POV consistency
      - Include sensory details
      - Embed character voice and personality
      - Build tension toward scene outcome
      - End with transition or hook to next scene
   
   c. **Check Foundation Consistency**:
      - Verify magic/technology use follows established rules
      - Ensure character actions align with established traits
      - Check world details match foundation
      - Maintain genre conventions
   
   d. **Track Progress**:
      - Update word count in chapters.md tracking table
      - Note any deviations from planned scene structure
      - Flag any new research needs discovered during writing

5. **Chapter Completion**:
   
   After completing each chapter:
   
   a. **Internal Review**:
      - Does chapter accomplish its stated purpose?
      - Are character voices consistent?
      - Is pacing appropriate?
      - Does chapter hook work?
      - Are scenes connected smoothly?
   
   b. **Continuity Check**:
      - Character details consistent with previous chapters
      - Timeline makes sense
      - No contradictions with foundation
      - Subplot threads maintained
   
   c. **Polish Pass**:
      - Remove redundant words and phrases
      - Strengthen weak verbs
      - Vary sentence structure
      - Check for POV slips
      - Ensure show vs. tell balance

6. **Progress Reporting**:
   
   After each chapter or writing session:
   - Update word count tracking table
   - Note completed chapters/scenes
   - Identify any issues or changes needed
   - Update estimated completion timeline
   - Flag any necessary revisions to outline/chapters

7. **Handling Deviations**:
   
   If story diverges from outline during writing:
   - Document the change and rationale
   - Assess impact on remaining chapters
   - Update chapters.md if needed
   - Ensure new direction still serves story goals
   - Maintain foundation consistency

## Writing Guidelines

### Voice & Style

**POV Consistency**:
- First person: Stay in character's head, limited knowledge
- Third person limited: Focus on POV character's perceptions
- Third person omniscient: Maintain god-like perspective
- Never slip between POV types within a scene

**Character Voice**:
- Each character should sound distinct in dialogue
- Internal thoughts reflect character personality
- Word choice appropriate to character background
- Emotional reactions consistent with character traits

**Show, Don't Tell**:
- Use action and dialogue to reveal character and emotion
- Avoid direct exposition dumps
- Trust readers to infer meaning
- Save telling for transitions and summaries

### Scene Elements

**Opening Lines**:
- Hook reader immediately
- Establish scene setting quickly
- Ground reader in POV and situation
- Create forward momentum

**Dialogue**:
- Each line should serve a purpose (reveal character, advance plot, or build tension)
- Use subtext - characters don't always say what they mean
- Vary dialogue tags but don't avoid "said"
- Include action beats to break up long exchanges

**Action Sequences**:
- Use short sentences for fast pacing
- Focus on key moments, not every movement
- Maintain clarity of what's happening
- Show character reactions and emotions
- End with consequences

**Description**:
- Integrate details through character perception
- Use sensory details beyond just visual
- Description should serve mood and tone
- Avoid stopping the story for description blocks

### Pacing

**Scene Length Variation**:
- Short scenes for high tension or quick transitions
- Longer scenes for important moments or complex interactions
- Mix lengths within chapters for rhythm

**Sentence Structure**:
- Vary sentence length for musicality
- Short sentences increase pace
- Longer sentences slow down and add detail
- Use fragments sparingly for impact

**Chapter Breaks**:
- End chapters at moments of tension or question
- Create desire to continue reading
- Use breaks strategically for time/POV shifts

## Quality Checks

**Per Scene**:
- [ ] Goal-Conflict-Outcome structure maintained
- [ ] POV consistent throughout
- [ ] Character voice authentic
- [ ] Foundation rules respected
- [ ] Sensory details included
- [ ] Scene advances plot or develops character

**Per Chapter**:
- [ ] Chapter purpose achieved
- [ ] Pacing appropriate
- [ ] Transitions smooth
- [ ] Chapter hook effective
- [ ] Word count on target (±20%)
- [ ] No plot holes or continuity errors

**Overall Story**:
- [ ] Character arcs tracking as planned
- [ ] Plot beats being hit
- [ ] Themes emerging naturally
- [ ] Foundation consistently applied
- [ ] Subplots progressing

## Error Handling

- **Writer's Block**: Skip to different scene, outline in more detail, or freewrite
- **Scene Not Working**: Review Goal-Conflict-Outcome; may need replanning
- **Character Off-Voice**: Reread character profile; do voice exercises
- **Pacing Issues**: Check scene lengths; may need to combine or split scenes
- **Plot Hole Discovered**: Document it; may need outline revision

## Success Criteria

- All planned scenes are drafted
- Word count within 10% of target
- Foundation consistency maintained
- Character arcs developing as outlined
- Story flows naturally scene to scene
- Each chapter accomplishes its purpose
- Writing quality meets genre standards

## Final Notes

**Writing is iterative**: First draft doesn't need to be perfect. The goal is to get the story down following the structure while maintaining consistency with your world foundation. Revision and polish come later.

**Stay flexible**: If the story naturally evolves during writing in a way that serves it better, that's okay. Just document changes and maintain consistency.

**Track everything**: Keep notes on character details, timeline, world elements used. This prevents continuity errors.
