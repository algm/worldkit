---
description: Deep-dive into character development through interviews, backstories, and relationship exploration.
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
   - Conduct interviews and write profiles in the configured language
   - Keep technical markers in English for consistency (file paths, section headers in templates)
   - Maintain the template structure while translating the content

## Outline

This command creates deep character profiles through structured interviews and biographical development. It's designed to help you know your characters as deeply as real people—including aspects that may never appear directly in your story but inform every choice they make.

### When to Use This Command

**Use `/worldkit.character` when**:
- You need to understand a character's voice and motivations deeply
- Character feels flat or one-dimensional
- You're writing multiple POV characters and need distinct voices
- Character's actions in outline feel unmotivated
- You want to explore character backstory and relationships
- Before writing POV chapters for a new character

**Best timing**:
- After `/worldkit.worldbuild` for protagonists and antagonists
- Before `/worldkit.outline` to ensure character actions are motivated
- After `/worldkit.outline` for supporting characters who became important
- Anytime a character isn't "clicking" in your mind

### Process

1. **Select Character**:
   - Identify which character to develop
   - Review existing character information from world.md
   - Determine depth needed (protagonist vs supporting)
   - Note specific gaps in understanding

2. **Conduct Character Interview**:
   
   **Present questions in character's voice** - pretend you're interviewing them:

   **Core Identity Questions**:
   - "What's your earliest memory?"
   - "What's something about you that most people get wrong?"
   - "If you could change one thing about your past, what would it be?"
   - "What are you most afraid of, and why?"
   - "What do you want more than anything? What's really behind that want?"
   
   **Relationships & Connections**:
   - "Who was the most important person in your life growing up?"
   - "Who do you trust completely? Why them?"
   - "Who have you hurt, and do you regret it?"
   - "What relationship do you wish you could repair?"
   - "Who sees the real you, without pretense?"

   **Values & Beliefs**:
   - "What principle would you never compromise on?"
   - "What's something you believe that others think is foolish?"
   - "What would you sacrifice everything for?"
   - "What betrayal could you never forgive?"
   - "How do you define success or a life well-lived?"

   **Secrets & Contradictions**:
   - "What secret are you keeping, and who are you keeping it from?"
   - "What do you hate about yourself?"
   - "When have you been a hypocrite?"
   - "What do you want to be seen as, vs. what you fear you really are?"
   - "What truth about yourself can you not face?"

   **Formative Events**:
   - "What event shaped who you are today?"
   - "When did you lose your innocence?"
   - "What's your biggest regret?"
   - "What moment are you most proud of?"
   - "What failure haunts you?"

3. **Build Extended Biography**:
   
   Create detailed timeline of character's life:

   **Childhood (ages 0-12)**:
   - Family dynamics and structure
   - Socioeconomic status and living conditions
   - Key friendships and relationships
   - Formative experiences
   - Wounds and joys from this period
   - How childhood shapes adult behavior

   **Adolescence (ages 13-18)**:
   - Identity formation
   - Rebellions and conformities
   - First love, first loss
   - Defining moments
   - Relationship with authority
   - Dreams and aspirations developed

   **Young Adulthood (ages 19-25)**:
   - Independence and its challenges
   - Career/purpose exploration
   - Significant relationships
   - Major life choices
   - Successes and failures
   - How they see themselves evolving

   **Present Day**:
   - Current circumstances
   - Unresolved issues from past
   - Daily life and routines
   - Current relationships
   - What they're running from/toward
   - How past informs present

4. **Map Relationships Web**:
   
   For each significant relationship:

   **Relationship to [Other Character]**:
   - **History**: How they met, history together
   - **Current Dynamic**: Power balance, emotional tone
   - **What Each Wants**: From the other person
   - **Unspoken Truths**: What can't be said
   - **Potential Evolution**: How this might change
   - **Conflict Points**: Sources of tension
   - **Bonds**: What connects them despite conflicts

5. **Explore Character Contradictions**:
   
   Real people are contradictory:
   
   - **Public vs Private Self**: How they present vs. who they are
   - **Stated Values vs Actions**: Where they don't live up to ideals
   - **Wants vs Needs**: What they think they want vs. what they need
   - **Strengths as Weaknesses**: How their gifts become flaws
   - **Fears Driving Desires**: What motivations come from fear
   - **Defensive Mechanisms**: How they protect themselves
   - **Growth Potential**: What must break for them to evolve

6. **Define Voice Elements**:
   
   **Speech Patterns**:
   - Vocabulary level and word choice
   - Sentence structure (short/long, simple/complex)
   - Verbal tics or favorite phrases
   - Profanity use (frequency, type)
   - Formality level in different contexts

   **Thought Patterns**:
   - Internal monologue style
   - How they process information
   - What they notice (details, emotions, patterns)
   - Metaphors and associations they use
   - Self-talk tone (critical, encouraging, analytical)

   **Perspective**:
   - Optimist, pessimist, realist?
   - Trust level of others
   - Default assumptions about motives
   - Humor style (if any)
   - Emotional accessibility

7. **Create Character Exercises**:
   
   **Voice Journal Entries**:
   - Write 3-5 journal entries in character's voice
   - Different emotional states
   - About different subjects
   - Helps establish authentic voice

   **Reaction Scenarios**:
   - How would character react to:
     * Unexpected good news
     * Devastating loss
     * Betrayal by friend
     * Stranger in need
     * Opportunity that scares them

   **Ordinary Day**:
   - Describe a typical day in detail
   - Morning routine
   - Work/daily activities
   - Evening unwinding
   - Reveals character through habits

### Output Structure

Create or update `{STORY_DIR}/characters/{character-name}.md`:

```markdown
# Character Profile: [Character Name]

**Role in Story**: [Protagonist/Antagonist/Supporting]
**Created**: [DATE]
**Status**: [Development stage]

## Quick Reference

**Age**: [X]
**Occupation**: [What they do]
**Key Trait**: [Defining characteristic]
**Core Want**: [What drives them]
**Fatal Flaw**: [What holds them back]

## Character Interview

### Core Identity

[Answers to identity questions]

### Relationships

[Answers to relationship questions]

### Values & Beliefs

[Answers to values questions]

### Secrets & Contradictions

[Answers to secrets questions]

### Formative Events

[Answers to formative events questions]

## Extended Biography

### Childhood (Ages 0-12)

[Detailed childhood narrative]

### Adolescence (Ages 13-18)

[Detailed adolescence narrative]

### Young Adulthood (Ages 19-25)

[Detailed young adult narrative]

### Present Day

[Current circumstances and how past informs present]

## Relationships Web

### To [Character 2]

- **History**: [...]
- **Current Dynamic**: [...]
- **What [Name] Wants From Them**: [...]
- **What They Want From [Name]**: [...]
- **Unspoken Truths**: [...]
- **Potential Evolution**: [...]

[Repeat for each significant relationship]

## Character Contradictions

**Public vs Private**:
[Description]

**Stated Values vs Actions**:
[Where they don't live up to own ideals]

**Wants vs Needs**:
[What they think they want vs. what would actually fulfill them]

**Strength as Weakness**:
[How their gifts become flaws in certain contexts]

## Voice Profile

### Speech Patterns

- **Vocabulary**: [...]
- **Sentence Structure**: [...]
- **Verbal Tics**: [...]
- **Profanity**: [...]
- **Formality**: [...]

### Thought Patterns

- **Internal Style**: [...]
- **What They Notice**: [...]
- **Metaphors Used**: [...]
- **Self-Talk Tone**: [...]

### Perspective

- **Worldview**: [...]
- **Trust Level**: [...]
- **Humor Style**: [...]

## Voice Samples

### Journal Entry 1 - [Emotional State]

[Entry in character's voice]

### Journal Entry 2 - [Different Emotional State]

[Entry in character's voice]

### Reaction to Betrayal

[How this character would react]

### A Typical Tuesday

[Ordinary day in character's life]

## Character Arc Notes

**Starting Point**: [Who they are at story beginning]

**Key Transformations**: [Moments that change them]

**Ending Point**: [Who they've become]

**What Must Break**: [What belief/behavior must shatter for growth]

## Writing Reminders

- [Key thing to remember about voice]
- [Characteristic gesture or habit]
- [What makes this character unique]
- [What to avoid (stereotypes to watch for)]

```

## Best Practices

**Do**:
- ✅ Answer questions IN character voice when possible
- ✅ Embrace contradictions - they make characters real
- ✅ Go deep on formative trauma and joy
- ✅ Connect character history to story conflict
- ✅ Create more biography than you'll use
- ✅ Let character surprise you with answers

**Don't**:
- ❌ Make characters perfectly consistent
- ❌ Answer questions you, the writer, don't know yet
- ❌ Force characters to fit your plot
- ❌ Ignore uncomfortable character truths
- ❌ Make every character likeable
- ❌ Skip contradictions for neatness

## Error Handling

- **No character specified**: Ask which character to develop
- **Character doesn't exist in world.md**: Create from scratch or cancel
- **Too many questions overwhelming**: Break into multiple sessions
- **Contradicts foundation**: Flag and help resolve

## Success Criteria

- Character feels like a real person you could meet
- You can predict how they'd react to novel situations
- Their voice is distinct and recognizable
- You understand motivations (even if readers won't see all of it)
- Contradictions and complexities exist
- Biography connects to story conflict
- Voice samples sound authentic
- Ready to write this character's POV

## Notes

**How much is too much?**
- For protagonists: Go deep. Everything affects the story.
- For antagonists: Understand them as well as protagonists
- For major supporting: Focus on relationship to protagonist and their role
- For minor characters: A few distinctive traits may be enough

**When to stop?**
When you can "hear" the character's voice in your head and know how they'd react to story events without having to think about it.
