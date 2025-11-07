---
description: Multi-pass revision system focusing on specific elements: dialogue, pacing, show-don't-tell, consistency, and prose polish.
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
   - Generate revision notes in the configured language
   - Keep technical markers in English for consistency (file paths, section headers)
   - Maintain the template structure while translating the content

## Outline

This command implements a professional multi-pass revision system. Instead of trying to fix everything at once, you make focused passes through your manuscript, each targeting a specific element. This approach (used by published authors like Holly Lisle, Margie Lawson, and James Scott Bell) produces stronger revisions than generic "editing."

### When to Use This Command

**Use `/worldkit.revise` when**:
- First draft complete
- Ready for focused revision passes
- Beta feedback identifies specific weaknesses
- Preparing manuscript for professional editing
- Self-editing before querying agents

**Best timing**:
- After first draft completion
- Before beta reader distribution
- After beta feedback received
- Before each submission round
- During self-editing phases

**Not for**:
- During drafting (finish the draft first)
- Line-editing (that's a later, separate pass)
- Proofreading (grammar/spelling comes last)

### Process

Choose ONE pass per revision session. Don't try to do all passes simultaneously.

---

## REVISION PASS 1: Dialogue Deep Dive

**Focus**: Make dialogue sound natural, reveal character, advance plot.

### Dialogue Pass Checklist

**For Each Line of Dialogue**:

1. **Read Aloud Test**:
   - Does it sound like something a real person would say?
   - Or does it sound "written"?
   - Flag: Overly formal, exposition-heavy, perfectly grammatical

2. **Character Voice**:
   - Could anyone else say this line?
   - Or is it distinctly THIS character?
   - Check against voice profile (if using `/worldkit.voice`)

3. **Subtext Check**:
   - Are characters saying exactly what they mean?
   - Real people rarely do - add subtext
   - Example: "I'm fine" when they're clearly not

4. **Purpose Test**:
   Every dialogue exchange should do 2+ of these:
   - ✅ Reveal character
   - ✅ Advance plot
   - ✅ Increase tension
   - ✅ Provide necessary information
   - ✅ Deepen relationships
   - ❌ If only doing one or none → cut or strengthen

5. **Dialogue Tag Audit**:
   - Use "said" 80% of the time
   - Cut unnecessary adverbs ("he said angrily" → show anger through words)
   - Replace tags with action beats sometimes
   - Example: "I don't believe you." She turned away. [No tag needed]

6. **Exposition in Dialogue**:
   - Flag: "As you know, Bob..." constructions
   - Characters telling each other what they both know
   - Fix: Characters discover information, or think it instead

7. **Interruptions & Overlap**:
   - Real conversations have interruptions
   - People talk over each other
   - Not every sentence finishes
   - Add em-dashes for interruptions: "But I thought—"

8. **Silence & Beats**:
   - Not all communication is verbal
   - Pauses matter
   - Action beats between dialogue create rhythm

### Dialogue Pass Output

Create `{STORY_DIR}/revision-notes/dialogue-pass-[chapter].md`:

```markdown
# Dialogue Revision Pass: Chapter [X]

**Date**: [DATE]
**Chapter**: [X - Chapter Title]

## Issues Found

### Line 47: [Quote]
- **Issue**: Too formal for character
- **Character**: [Name]
- **Fix**: [Revised line]

### Exchange starting line 103
- **Issue**: Pure exposition - characters telling each other known information
- **Fix**: [Revised exchange or note to cut]

### Line 215: [Quote]
- **Issue**: Generic - any character could say this
- **Fix**: [Add character-specific word choice/phrasing]

## Strengthened Exchanges

### Lines 89-95: [Brief description]
- **Original Purpose**: Advance plot
- **Enhanced To**: Advance plot + reveal character tension + increase relationship conflict

## Tags & Beats Audit

- **"Said" usage**: 45/60 tags (75%) ✅
- **Adverbs removed**: 12 instances
- **Action beats added**: 8 new beats for rhythm
- **Unnecessary tags cut**: 5

## Summary

- **Lines revised**: 23
- **Exchanges cut**: 2
- **Subtext added**: 7 instances
- **Character voice strengthened**: 5 lines

**Ready for next pass**: ✅
```

---

## REVISION PASS 2: Pacing Analysis

**Focus**: Ensure story moves at appropriate speed, with variation in rhythm.

### Pacing Pass Checklist

1. **Scene/Sequel Balance** (Dwight Swain structure):
   
   **Scenes** (action, external conflict):
   - Goal → Conflict → Disaster
   - Fast-paced, short paragraphs, active
   
   **Sequels** (reaction, internal processing):
   - Reaction → Dilemma → Decision
   - Slower, reflection, character processing
   
   **Check**: Are you alternating? Or all action / all introspection?

2. **Chapter Pace Variation**:
   
   | Chapter | Type | Pace | Notes |
   |---------|------|------|-------|
   | 1 | Scene | Fast | Action opening ✅ |
   | 2 | Sequel | Slow | Processing ✅ |
   | 3 | Scene | Fast | Building tension ✅ |
   | 4 | Scene | Fast | ⚠️ Two fast in a row - add breathing room? |
   
   **Fix**: Insert sequel or slow moment if too many fast scenes in a row

3. **Paragraph Length Rhythm**:
   - Fast pace: Short paragraphs (1-3 sentences)
   - Slow pace: Longer paragraphs (5-8 sentences)
   - Vary for rhythm
   - **Audit**: Count paragraph lengths per chapter
   - **Flag**: Monotonous lengths (all medium, no variation)

4. **Sentence Length Rhythm**:
   - Tension/action: Short sentences. Punchy. Breathless.
   - Calm/description: Longer, flowing sentences that allow the reader to settle into the scene.
   - **Mix lengths**: Even in fast scenes, occasionally break with a longer sentence for contrast

5. **Information Delivery Speed**:
   - Are you info-dumping (too slow)?
   - Are you withholding necessary context (confusingly fast)?
   - Spread information across scenes, not all at once

6. **Tension Escalation**:
   - Each chapter should generally increase story tension
   - Or maintain high tension if in climax
   - **Flag**: Chapters that release tension without payoff
   - Quiet moments should be earned (after high tension) and brief

7. **Cut the Slow Parts**:
   - Travel scenes that don't develop character
   - Repetitive daily routines
   - Backstory dumps
   - Over-description of settings
   - **Ask**: Does this scene advance plot or character? If no → cut or compress

### Pacing Pass Output

Create `{STORY_DIR}/revision-notes/pacing-pass.md`:

```markdown
# Pacing Revision Pass

**Date**: [DATE]
**Chapters Analyzed**: [Range]

## Chapter Pacing Map

| Chapter | Type | Pace | Para Length Avg | Sentence Length Avg | Issues |
|---------|------|------|-----------------|---------------------|--------|
| 1 | Scene | Fast | 2.3 | 12 | ✅ Good action opening |
| 2 | Sequel | Slow | 6.1 | 18 | ✅ Needed breathing room |
| 3 | Scene | Fast | 2.1 | 11 | ✅ Tension builds |
| 4 | Scene | Fast | 2.8 | 13 | ⚠️ Too fast too long - add reflection |
| 5 | Sequel | Med | 5.0 | 15 | ✅ Dilemma & decision |

## Scene/Sequel Balance

- **Scenes**: 18 chapters
- **Sequels**: 7 chapters
- **Ratio**: 72% scene / 28% sequel
- **Assessment**: ✅ Good balance (aim for 60-70% scene)

## Rhythm Issues Found

### Chapter 4
- **Issue**: 47 consecutive short paragraphs (1-2 sentences)
- **Effect**: Exhausting, no variation
- **Fix**: Combine paragraphs 12-15 into longer para; add breathing room at line 89

### Chapters 8-10
- **Issue**: Three fast-paced scenes with no sequel
- **Effect**: Reader exhaustion, no processing time
- **Fix**: Add short sequel section in Chapter 10 (character reflecting on consequences)

## Cuts Made

### Chapter 6, Lines 234-289
- **Cut**: 55-line travel sequence
- **Reason**: No character development, no plot advancement
- **Kept**: 1 paragraph establishing time passage

### Chapter 12, Lines 45-78
- **Cut**: Backstory dump about magic system
- **Reason**: Stopped forward momentum
- **Relocated**: Distributed across Chapters 10, 11, 13 as character learns

## Sentence Rhythm Adjustments

### Chapter 15 (Climax Fight)
- **Before**: Mix of long and short sentences (varied)
- **After**: Mostly short. Punchy. Breathless. One longer sentence for contrast.
- **Effect**: Increased tension and speed

## Summary

- **Chapters needing pace adjustment**: 4
- **Scenes/sequels rebalanced**: 2
- **Lines cut for pacing**: 234
- **Paragraph rhythm improved**: 6 chapters

**Overall pacing**: ✅ Strong with adjustments
```

---

## REVISION PASS 3: Show Don't Tell

**Focus**: Replace telling with showing through action, dialogue, sensory detail.

### Show/Tell Pass Checklist

1. **Emotion Telling**:
   
   **Telling**: "She was angry."
   **Showing**: "Her jaw clenched. She hurled the glass against the wall."
   
   **Find**: Emotional state words (angry, sad, happy, afraid, confused)
   **Replace**: Physical reactions, dialogue, actions

2. **Character Trait Telling**:
   
   **Telling**: "He was a cautious person."
   **Showing**: "He checked the lock three times before leaving."
   
   **Find**: "He/she was [trait]" constructions
   **Replace**: Behaviors that demonstrate the trait

3. **Relationship Telling**:
   
   **Telling**: "They had been friends for years."
   **Showing**: Shared jokes, comfortable silences, finishing each other's sentences
   
   **Find**: Statements about relationships
   **Replace**: Interactions that demonstrate the relationship

4. **Filter Words** (distance readers from POV):
   
   **Telling with filters**:
   - "She saw..."
   - "He heard..."
   - "She felt..."
   - "He realized..."
   - "She noticed..."
   
   **Showing (deep POV)**:
   - Just describe what she sees: "The door stood open."
   - Just describe what he hears: "Footsteps echoed in the hall."
   - Just describe the feeling: "Her stomach churned."
   
5. **Motivation Telling**:
   
   **Telling**: "He lied because he was afraid."
   **Showing**: "He lied. His voice cracked on the last word."
   
   **Let readers** infer motivation from behavior

6. **Sensory Telling**:
   
   **Telling**: "The room was dirty."
   **Showing**: "Dust coated the furniture. The air smelled of mildew and neglect."
   
   **Engage senses**: sight, smell, sound, touch, taste

7. **When Telling is OK**:
   - Transitions (passage of time)
   - Unimportant details
   - Pacing (showing everything = too slow)
   - **Rule**: Show important moments, tell connective tissue

### Show/Tell Pass Output

Create `{STORY_DIR}/revision-notes/show-tell-pass-[chapter].md`:

```markdown
# Show/Tell Revision Pass: Chapter [X]

**Date**: [DATE]
**Chapter**: [X]

## Tells Converted to Shows

### Line 23
- **Told**: "She was devastated."
- **Showed**: "Her hands trembled as she set down the letter. She couldn't breathe."

### Line 67
- **Told**: "He was a careful man."
- **Showed**: "He tested each foothold twice before committing his weight."

### Line 134
- **Told**: "The village was poor."
- **Showed**: "Children played in dirt streets, their ribs visible through torn tunics. The smell of spoiled cabbage hung in the air."

## Filter Words Removed

### Line 45
- **Before**: "She saw the blood on his hands."
- **After**: "Blood stained his hands."

### Line 89
- **Before**: "He heard someone approaching."
- **After**: "Footsteps. Close."

### Line 156
- **Before**: "She felt a wave of nausea."
- **After**: "Her stomach lurched."

## Intentional Tells (Kept)

### Line 201
- **Tell**: "Three weeks passed."
- **Reason**: Transition, not important to show every day

### Line 289
- **Tell**: "He was the third son of a minor noble."
- **Reason**: Necessary information, showing would take too long

## Summary

- **Tells converted**: 23
- **Filter words removed**: 17
- **Intentional tells kept**: 5
- **Sensory details added**: 12

**Show/Tell balance**: ✅ Improved
```

---

## REVISION PASS 4: Consistency Check

**Focus**: Catch continuity errors, timeline issues, character contradictions.

### Consistency Pass Checklist

1. **Use Story Bible**:
   - If created `/worldkit.bible`, reference it
   - Verify all flagged inconsistencies resolved
   - Cross-check character descriptions, timeline, locations

2. **Character Consistency**:
   - Physical descriptions (eye color, height, scars)
   - Personality traits match behavior
   - Knowledge - don't know things they shouldn't
   - Skills don't disappear or appear randomly
   - Relationships consistent with history

3. **Timeline Consistency**:
   - Travel time realistic
   - Character ages match birth dates
   - Seasons/weather appropriate
   - Pregnancy timelines accurate
   - References to "yesterday" or "last week" match

4. **World Rules Consistency**:
   - Magic system follows established rules
   - Technology capabilities consistent
   - Social rules and customs maintained
   - Geography/distances don't change

5. **Subplot Tracking**:
   - All subplots resolved or intentionally left open
   - No dropped threads
   - No characters who disappear without explanation

### Consistency Pass Output

Create `{STORY_DIR}/revision-notes/consistency-pass.md`:

```markdown
# Consistency Revision Pass

**Date**: [DATE]
**Tool Used**: story-bible.md

## Inconsistencies Fixed

### Character Description - [Character Name]
- **Issue**: Eyes described as blue (Ch 2) and green (Ch 15)
- **Fix**: Standardized to blue, corrected Ch 15
- **Lines Changed**: Ch 15, line 67

### Timeline Error
- **Issue**: Ch 10 set "three days later," but only 1 day passed based on events
- **Fix**: Changed to "the next day"
- **Lines Changed**: Ch 10, line 1

### Magic System Violation
- **Issue**: Ch 18 character uses magic without established cost
- **World Rule**: Magic costs physical energy
- **Fix**: Added exhaustion consequences after magic use
- **Lines Changed**: Ch 18, lines 234-240

### Dropped Subplot
- **Issue**: Ch 7 introduces [minor character]'s problem, never resolved
- **Fix**: Added resolution in Ch 22, lines 156-178

## Verified Consistent

- ✅ All character physical descriptions match
- ✅ Timeline accurate across all chapters
- ✅ Geography/travel times consistent
- ✅ Magic system rules maintained
- ✅ All introduced subplots resolved

## Still Monitoring

- ⚠️ Character [Name]'s accent - occasionally drops in dialogue, verify in dialogue pass

## Summary

- **Errors fixed**: 8
- **Story bible updated**: Yes
- **Ready for submission**: ✅ (from consistency standpoint)
```

---

## REVISION PASS 5: Prose Polish

**Focus**: Strengthen word choice, eliminate weak constructions, enhance rhythm.

### Prose Pass Checklist

1. **Weak Verbs**:
   - Find: "was," "were," "is," "are" (to be verbs)
   - Often indicate passive voice or telling
   - Replace with stronger, active verbs
   - Example: "She was running" → "She ran" or "She sprinted"

2. **Adverb Reduction**:
   - Find: "-ly" words
   - Often indicate weak verb choice
   - Example: "walked slowly" → "trudged" or "crept"
   - Keep sparingly for emphasis

3. **Cliché Hunt**:
   - "Cold as ice"
   - "Time stood still"
   - "Heart pounded"
   - Replace with fresh, specific descriptions

4. **Repetition Check**:
   - Same words used too close together
   - Sentence structures too similar
   - Vary deliberately

5. **Passive Voice**:
   - Find: "was [verb]ed by"
   - Example: "The door was opened by John" → "John opened the door"
   - Passive sometimes OK for emphasis or unknown actor

6. **Purple Prose**:
   - Overly flowery or complex language
   - Draws attention to writing, not story
   - Simplify if obstructing clarity

7. **First Line/Paragraph**:
   - Strongest opening possible?
   - Hook the reader immediately
   - Cut throat: delete first paragraph, see if second is stronger

### Prose Pass Output

Create `{STORY_DIR}/revision-notes/prose-pass-[chapter].md`:

```markdown
# Prose Polish Pass: Chapter [X]

**Date**: [DATE]
**Chapter**: [X]

## Weak Verbs Strengthened

### Line 34
- **Before**: "She was walking through the forest."
- **After**: "She trudged through the forest."

### Line 102
- **Before**: "The guard was standing at the gate."
- **After**: "The guard loomed at the gate."

## Adverbs Cut/Replaced

### Line 56
- **Before**: "He said angrily"
- **After**: "He snarled" [stronger verb, no adverb needed]

### Line 145
- **Before**: "She ran quickly"
- **After**: "She sprinted"

## Clichés Replaced

### Line 78
- **Before**: "Her heart pounded in her chest."
- **After**: "Her pulse hammered in her throat."

### Line 201
- **Before**: "Time stood still."
- **After**: "The world narrowed to his face."

## Repetition Fixed

### Lines 112-125
- **Issue**: "She walked" used 4 times in one paragraph
- **Fix**: Varied with "moved," "crossed," "approached," plus cut one instance

## Passive to Active

### Line 67
- **Before**: "The message was delivered by a courier."
- **After**: "A courier delivered the message."

## Opening Paragraph

- **Original First Para**: [Description of character waking up]
- **Assessment**: Too slow, cliché opening
- **New Opening**: [Starts mid-action, raises question]
- **Result**: Stronger hook ✅

## Summary

- **Weak verbs replaced**: 34
- **Adverbs cut**: 23
- **Clichés replaced**: 8
- **Passive voice converted**: 12
- **Repetition fixed**: 15 instances

**Prose strength**: ✅ Significantly improved
```

---

## Combined Revision Strategy

### Recommended Order

1. **Big Picture First**: Pacing, consistency (structure)
2. **Middle Detail**: Show/tell, dialogue (scene level)
3. **Final Polish**: Prose (sentence level)

### Multi-Pass Schedule Example

**Week 1**: Pacing Pass (all chapters)
**Week 2**: Consistency Pass (using story bible)
**Week 3**: Dialogue Pass (Chapters 1-10)
**Week 4**: Dialogue Pass (Chapters 11-20)
**Week 5**: Show/Tell Pass (all chapters)
**Week 6**: Prose Polish Pass (all chapters)
**Week 7**: Final read-through, fix remaining issues

### Output Structure

Create `{STORY_DIR}/revision-notes/revision-tracker.md`:

```markdown
# Revision Tracker

**Story**: [Title]
**Total Chapters**: [X]

## Pass Status

| Pass Type | Status | Chapters Complete | Date Started | Date Finished |
|-----------|--------|-------------------|--------------|---------------|
| Pacing | ✅ Complete | 25/25 | [DATE] | [DATE] |
| Consistency | ✅ Complete | 25/25 | [DATE] | [DATE] |
| Dialogue | 🔄 In Progress | 15/25 | [DATE] | - |
| Show/Tell | ⏸️ Not Started | 0/25 | - | - |
| Prose Polish | ⏸️ Not Started | 0/25 | - | - |

## Current Focus

**Pass**: Dialogue Deep Dive
**Chapter**: 16
**Issues found so far**: 67
**Estimated completion**: [DATE]

## Overall Progress

- **Revision Passes Complete**: 2/5
- **Total Issues Found**: 234
- **Total Issues Fixed**: 187
- **Outstanding Issues**: 47

## Next Steps

1. Complete Dialogue Pass (Chapters 16-25)
2. Begin Show/Tell Pass
3. Final Prose Polish
4. Submit to beta readers

```

## Best Practices

**Do**:
- ✅ Focus on ONE pass at a time
- ✅ Take breaks between passes (see with fresh eyes)
- ✅ Keep detailed notes of changes
- ✅ Save previous versions (don't overwrite)
- ✅ Read aloud during dialogue and prose passes
- ✅ Use story bible for consistency pass

**Don't**:
- ❌ Try to fix everything in one pass (overwhelming, less effective)
- ❌ Revise while still drafting (finish first)
- ❌ Skip passes you find boring (they're all important)
- ❌ Delete old versions (version control is your friend)
- ❌ Rush - each pass takes time

## Error Handling

- **Too many issues found**: Normal! First pass always finds the most. Take it chapter by chapter.
- **Contradicting fixes**: Note conflict, resolve in final integration pass
- **Overwhelming**: Do one chapter at a time, one pass at a time
- **Second-guessing**: Trust the process. If a pass flags it, address it.

## Success Criteria

- All passes complete
- Issues documented and resolved
- Manuscript significantly stronger than first draft
- Beta readers confirm improvements
- Ready for professional editing or submission
- You're confident in the manuscript quality

## Notes

**How many passes are enough?**
- Minimum: 3-4 focused passes
- Typical: 5-7 passes over several weeks
- Some authors: 10+ passes
- When to stop: When you're changing things back, you're done

**Professional editing still needed?**
- Yes! These passes improve your manuscript
- Professional editors catch things you can't
- Self-revision + professional editing = strongest manuscript

**Different writers, different needs**:
- Some writers naturally show; skip show/tell pass
- Some write clean dialogue; quick dialogue pass
- Focus passes on YOUR weaknesses
