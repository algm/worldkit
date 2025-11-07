---
description: Develop and maintain consistent character voices across POV chapters through voice journals, exercises, and cross-chapter verification.
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
   - Generate voice exercises in the configured language
   - Keep technical markers in English for consistency (file paths, section headers)
   - Maintain the template structure while translating the content

## Outline

This command helps you develop and maintain distinct, consistent voices for POV characters. For multi-POV narratives, readers should be able to identify the POV character from voice alone—before seeing the chapter heading. This command provides exercises, tracking, and verification tools.

### When to Use This Command

**Use `/worldkit.voice` when**:
- Writing multi-POV narrative
- Before starting a new POV character's first chapter
- When beta readers can't distinguish POV voices
- After a break from the project (to "re-find" the voice)
- During revision to strengthen voice consistency
- When a character's voice feels generic or interchangeable

**Best timing**:
- After character profiles complete (`/worldkit.character`)
- Before writing each POV character's first chapter
- At the start of each writing session (warm-up exercise)
- During revision passes focused on voice

### Process

1. **Identify POV Characters**:
   
   Load character profiles to identify:
   - Who has POV chapters
   - How many POV characters total
   - Current voice consistency status
   - Which characters need voice development

2. **Define Voice Elements per Character**:
   
   For each POV character, establish:

   **A. Vocabulary & Diction**:
   - **Complexity**: Simple vs. complex words
   - **Formality**: Casual vs. formal speech
   - **Cultural/Educational Background**: Influences word choice
   - **Profession-Specific**: Jargon or technical terms
   - **Forbidden Words**: Words this character would never use
   - **Signature Words**: Repeated phrases or terms
   
   **B. Sentence Structure**:
   - **Length**: Short, punchy vs. long, flowing
   - **Complexity**: Simple vs. complex/compound
   - **Fragments**: Does character think in fragments?
   - **Rhythm**: Staccato vs. flowing
   - **Paragraph Length**: Dense vs. white space
   
   **C. Thought Patterns**:
   - **Logical vs. Emotional**: How they process
   - **Linear vs. Associative**: Organized or jumpy
   - **Introspective vs. External**: Focus inward or outward
   - **Observational Style**: What they notice first
   - **Metaphor/Imagery**: Types they use, frequency
   
   **D. Emotional Access**:
   - **Awareness**: How in touch with own emotions
   - **Expression**: How they describe feelings
   - **Deflection**: Do they avoid emotional language?
   - **Intensity**: Dramatic vs. understated
   
   **E. Worldview Filter**:
   - **Optimist/Pessimist/Realist**
   - **Trust Level**: Suspicious vs. trusting
   - **Judgmental vs. Accepting**
   - **What They Value**: Colors observations
   - **Fears**: Shape interpretation of events

3. **Create Voice Contrast Matrix**:
   
   If multiple POV characters, ensure differentiation:

   | Element | Character A | Character B | Character C |
   |---------|-------------|-------------|-------------|
   | Sentence Length | Short (5-10 words avg) | Medium (12-15) | Long (20+) |
   | Vocabulary | Simple, direct | Educated, formal | Poetic, metaphorical |
   | Thought Pattern | Linear, practical | Circular, anxious | Associative, artistic |
   | Emotional Access | Avoids naming emotions | Over-analyzes feelings | Feels deeply, can't articulate |
   | Notices First | Threats, exits | Social dynamics | Beauty, sensory details |
   | Metaphors From | Combat, warfare | Books, literature | Nature, seasons |
   | Humor | Sarcastic | Self-deprecating | Gentle, whimsical |
   
   **Goal**: No two characters should be identical in more than 1-2 categories.

4. **Voice Warm-Up Exercises**:
   
   Before writing a POV chapter, complete 2-3 of these:

   **Exercise 1: Morning Routine**
   - Write 1-2 paragraphs of character's morning in their voice
   - Focus on internal monologue
   - What do they notice? How do they describe it?
   - Establishes voice before tackling actual scene
   
   **Exercise 2: Reaction to News**
   - Character learns [neutral news]: A friend is getting married
   - Write their immediate internal reaction (2-3 paragraphs)
   - Reveals thought patterns, emotional processing
   
   **Exercise 3: Describing the Same Scene**
   - Write the same physical scene (e.g., a marketplace) from each POV
   - What does each character notice?
   - How do they describe it differently?
   - Highlights voice distinctions
   
   **Exercise 4: Internal Argument**
   - Character debates a decision internally
   - How do they weigh options?
   - What language do they use?
   - Shows logic vs. emotion balance
   
   **Exercise 5: Sensory Focus**
   - Describe a room using only character's prioritized senses
   - What sense dominates? (Sight, sound, smell, etc.)
   - Establishes sensory preference per POV

5. **Voice Journal Entry System**:
   
   Create ongoing voice journals:

   **Purpose**:
   - Practice writing in character voice
   - Develop authentic internal monologue
   - Create reference samples for consistency
   
   **Method**:
   Write 300-500 word journal entries in character voice:
   
   **Topics**:
   - Reflecting on a story event from their perspective
   - Describing another character
   - Processing a fear or desire
   - Remembering a formative moment
   - Reacting to world events
   
   **Frequency**:
   - 3-5 entries before starting their POV chapters
   - 1 entry before each new chapter as warm-up
   - Additional entries if voice feels inconsistent

6. **Chapter Voice Audit**:
   
   After writing POV chapters, verify consistency:

   **Read-Aloud Test**:
   - Read chapter aloud
   - Does it sound like this character?
   - Would you know whose POV without the heading?
   
   **Blind Test** (if possible):
   - Have beta reader read excerpt without POV label
   - Can they identify the character?
   - What voice elements tipped them off?
   
   **Consistency Checklist**:
   - [ ] Vocabulary appropriate to character
   - [ ] Sentence structure matches voice profile
   - [ ] Thought patterns consistent
   - [ ] Notices things this character would notice
   - [ ] Emotional access consistent
   - [ ] Metaphors/imagery fit character background
   - [ ] Distinct from other POV characters
   
   **Flag Issues**:
   - Sentences that sound like different character
   - Word choices out of character
   - Thought patterns inconsistent
   - Generic observations any character could make

7. **Voice Evolution Tracking**:
   
   Character voice can evolve with arc:

   **Document Evolution**:
   - **Beginning Voice**: [Characteristics]
   - **Midpoint Shifts**: [How trauma/growth changes voice]
   - **Ending Voice**: [Transformed characteristics]
   
   **Example**:
   - **Ch 1-5**: Short, defensive sentences; avoids vulnerability
   - **Ch 10-15**: Sentences lengthen slightly; begins naming emotions
   - **Ch 20+**: More complex structure; emotional openness increases
   
   **Ensure**:
   - Evolution is gradual, not sudden
   - Core voice elements remain recognizable
   - Changes connect to character arc events

8. **Cross-Chapter Verification**:
   
   Maintain consistency across POV appearances:

   **Sample Sentences**:
   Extract 5-10 sample sentences from each POV chapter:
   - Compare across chapters
   - Do they sound consistent?
   - Flag outliers
   
   **Word Cloud**:
   Generate word frequency for each POV character:
   - Identifies overused words
   - Highlights vocabulary differences
   - Catches unintentional repetition
   
   **Rhythm Analysis**:
   - Average sentence length per chapter
   - Paragraph structure consistency
   - Pacing variations (should be intentional)

### Output Structure

Create `{STORY_DIR}/voices/{character-name}-voice.md`:

```markdown
# Voice Profile: [Character Name]

**POV Chapters**: [List of chapters with this POV]
**Created**: [DATE]
**Last Updated**: [DATE]

---

## Voice Elements

### Vocabulary & Diction

- **Complexity Level**: [Simple/Moderate/Complex]
- **Formality**: [Casual/Neutral/Formal]
- **Background Influence**: [Education, profession, culture affecting word choice]
- **Signature Words/Phrases**: 
  * "[Phrase or word they use frequently]"
  * "[Another signature]"
- **Forbidden Words**: [Words/phrases this character would never use]
- **Example Vocabulary**:
  * Describes anger as: [word choice]
  * Describes beauty as: [word choice]
  * Curse words: [specific to character]

### Sentence Structure

- **Average Length**: [5-10 words / 12-15 / 18-25 / 25+]
- **Complexity**: [Simple / Compound / Complex / Varied]
- **Fragment Use**: [Frequent / Occasional / Rare / Never]
- **Rhythm**: [Staccato / Flowing / Varied]
- **Example Patterns**:
  * "Short. Punchy. Direct." ← [Character A style]
  * "Long, flowing sentences that meander through thoughts and observations, circling back to the main point." ← [Character B style]

### Thought Patterns

- **Processing Style**: [Logical / Emotional / Mixed]
- **Organization**: [Linear / Associative / Circular]
- **Focus**: [Introspective / External / Balanced]
- **Observational Priority**:
  1. [What they notice first - e.g., threats, beauty, people]
  2. [Second priority]
  3. [Third priority]
- **Internal Monologue Tone**: [Anxious / Confident / Self-critical / Etc.]

### Emotional Access

- **Emotional Awareness**: [High / Moderate / Low]
- **Expression Style**: [Direct naming / Metaphorical / Avoidant]
- **Intensity**: [Dramatic / Understated / Moderate]
- **Example**:
  * When sad: [How they describe/process sadness]
  * When angry: [How they describe/process anger]
  * When joyful: [How they describe/process joy]

### Worldview Filter

- **Outlook**: [Optimist / Pessimist / Realist / Cynic]
- **Trust Default**: [Trusting / Suspicious / Neutral]
- **Judgment Level**: [Quick to judge / Accepting / Analytical]
- **Core Values**: [What colors their observations]
- **Fears**: [What biases their interpretation]

### Metaphors & Imagery

- **Frequency**: [Rare / Moderate / Frequent / Constant]
- **Source Domain**: [Where metaphors come from]
  * Example: Military metaphors (combat background)
  * Example: Nature imagery (rural upbringing)
  * Example: Literary references (well-read)
- **Examples**:
  * "[Sample metaphor this character would use]"
  * "[Another example]"

---

## Voice Contrast

**Distinct From [Other POV Character]**:
- [Character B] uses long sentences; [This character] uses short
- [Character B] notices people first; [This character] notices environment
- [Character B] metaphors from nature; [This character] from urban life

**Distinct From [Third POV Character]**:
- [Similar contrasts]

---

## Voice Samples

### Sample 1: Morning Routine (Warm-up Exercise)

[300-500 word sample in character voice]

Morning arrived like [metaphor in character voice]. [Character] [action described in their voice pattern].

[Internal monologue demonstrating thought patterns, vocabulary, sentence structure]

### Sample 2: Journal Entry - Reflecting on [Story Event]

[300-500 word journal entry]

### Sample 3: Describing [Location] (Same Scene Exercise)

[Paragraph describing a location in this character's voice]

### Sample 4: Reaction to [News/Event]

[Internal reaction demonstrating emotional processing]

---

## Voice Evolution

### Beginning (Chapters 1-5)

**Characteristics**:
- [How voice starts]
- Sentence structure: [Initial pattern]
- Emotional access: [Initial level]
- Example: "[Sample sentence from early chapters]"

### Midpoint Evolution (Chapters 10-15)

**Changes**:
- [How voice shifts after formative events]
- Triggered by: [Event that changes character]
- New patterns: [What's different]
- Example: "[Sample sentence showing evolution]"

### Ending (Chapters 20+)

**Transformation**:
- [Final voice state]
- Still recognizable because: [Core elements that remain]
- Growth shown in: [What aspects changed]
- Example: "[Sample sentence from late chapters]"

---

## Writing Reminders

**Before Writing This POV**:
- [ ] Complete 1-2 warm-up exercises
- [ ] Review voice samples
- [ ] Check last chapter for sentence rhythm
- [ ] Remember: [Character] notices [X] first, describes using [Y] metaphors

**During Writing**:
- [ ] Read dialogue aloud to check voice
- [ ] Verify vocabulary choices
- [ ] Check sentence length variety within character's range
- [ ] Ensure observations filter through character's worldview

**After Writing**:
- [ ] Read-aloud test
- [ ] Compare to previous POV chapters for consistency
- [ ] Extract 5-10 sample sentences for voice library

---

## Consistency Checklist

**Chapter [X] - [Date Written]**:
- ✅ Vocabulary appropriate
- ✅ Sentence structure consistent
- ✅ Thought patterns match profile
- ⚠️ Issue: [Flagged inconsistency and fix]

**Chapter [Y] - [Date Written]**:
- ✅ All checks passed

---

## Sample Sentence Library

**Chapter 1**:
- "[Sample sentence]"
- "[Sample sentence]"

**Chapter 5**:
- "[Sample sentence showing consistency]"
- "[Sample showing slight evolution]"

**Chapter 10**:
- "[Sample showing midpoint evolution]"

---

## Beta Reader Feedback

**Reader A**: "Could immediately tell this was [Character]'s POV because of [element]"

**Reader B**: "Chapter X felt off - didn't sound like [Character]" → [Fix applied]

---

## Quick Reference

**When stuck**, ask:
- How would [Character] describe this in one word?
- What would [Character] notice first in this scene?
- Is this sentence too long/short for [Character]?
- Would [Character] use this vocabulary?
- Does this metaphor fit [Character]'s background?

```

Also create `{STORY_DIR}/voices/voice-comparison.md`:

```markdown
# Voice Comparison Matrix

**Story**: [Title]
**POV Characters**: [List]

---

## Side-by-Side Voice Elements

| Element | [Character A] | [Character B] | [Character C] |
|---------|---------------|---------------|---------------|
| **Avg Sentence Length** | 5-10 words | 15-20 words | 25+ words |
| **Vocabulary** | Simple, direct | Formal, educated | Poetic, literary |
| **Thought Pattern** | Linear, practical | Circular, anxious | Associative |
| **Emotional Access** | Avoidant | Over-analytical | Deep but inarticulate |
| **Notices First** | Threats | Social dynamics | Beauty |
| **Metaphors From** | Combat | Books | Nature |
| **Paragraph Length** | Short, white space | Dense blocks | Medium |
| **Fragment Use** | Frequent | Rare | Never |
| **Humor Style** | Sarcastic | Self-deprecating | Whimsical |

---

## Same Scene, Different Voices

**Scene**: [Character] enters a crowded marketplace

### [Character A]'s POV

[300 word sample]

### [Character B]'s POV

[300 word sample of SAME scene]

### [Character C]'s POV

[300 word sample of SAME scene]

**Reader Test**: Could you identify each POV without labels? What tipped you off?

---

## Voice Verification Checklist

**Can you identify POV from a random paragraph?**
- [ ] Yes, instantly
- [ ] Yes, within 2-3 sentences
- [ ] Sometimes
- [ ] Rarely

**What makes each voice distinct?**
- [Character A]: [1-2 most recognizable elements]
- [Character B]: [1-2 most recognizable elements]
- [Character C]: [1-2 most recognizable elements]

**Overlap concerns**:
- [ ] No significant overlap
- [ ] Minor overlap in [X], but still distinguishable
- ⚠️ Too similar: [Characters] in [aspect] → [Fix plan]

```

## Best Practices

**Do**:
- ✅ Complete warm-up exercises before writing POV chapters
- ✅ Maintain voice sample libraries for reference
- ✅ Read POV chapters aloud to verify voice
- ✅ Allow voice to evolve with character arc
- ✅ Ensure each POV is distinct in 4+ elements
- ✅ Use beta readers for blind voice tests

**Don't**:
- ❌ Make voices so extreme they're caricatures
- ❌ Suddenly shift voice without character development cause
- ❌ Forget to warm up before switching POV characters
- ❌ Ignore feedback that voices are too similar
- ❌ Let all characters sound like the author
- ❌ Sacrifice clarity for voice distinctiveness

## Error Handling

- **Too many POV characters**: Focus on 2-3 most distinct first, add others gradually
- **Voices too similar**: Increase contrast in 2-3 key elements (sentence length, metaphor source, thought pattern)
- **Voice feels fake**: Simplify, focus on 1-2 core distinctions rather than forcing every element
- **Can't maintain consistency**: Create more reference samples, do more warm-ups

## Success Criteria

- Readers can identify POV from voice alone (without chapter heading)
- Each POV character sounds distinct from others
- Voice remains consistent across POV chapters (unless intentionally evolved)
- Voice fits character background, education, personality
- Voice warm-ups feel natural, not forced
- Beta readers confirm voices are distinct
- You can "hear" each character's voice in your head
- Voice enhances characterization, not just differentiates

## Notes

**How distinct is enough?**
- Minimum: Readers notice "this feels different" when POV switches
- Ideal: Readers know whose POV within 1-2 paragraphs
- Excellent: Readers know from the first sentence

**Voice vs Clarity**:
- Voice should never obscure meaning
- If readers confused, simplify voice
- Distinction through clarity, not opacity

**Single POV novels**:
- Still useful for consistency tracking
- Focus on voice evolution with arc
- Ensure voice fits character authentically
