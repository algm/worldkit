---
description: Ask structured questions to expand underspecified story elements before outlining.
---

## User Input

```text
$ARGUMENTS
```

You **MUST** consider the user input before proceeding (if not empty).

## Outline

This command helps expand underspecified elements in your world/story description through structured questioning. It's designed to be run **after** `/worldkit.worldbuild` but **before** `/worldkit.outline`.

### When to Use This Command

**Use `/worldkit.expand` when**:
- World description has [NEEDS EXPANSION] markers
- Characters feel underdeveloped
- Setting lacks vivid details
- Central conflict seems vague
- World rules are unclear or incomplete
- You want to add depth before outlining

**Skip this command when**:
- World description is detailed enough for your needs
- You prefer to discover details during writing
- Creating a short story or flash fiction
- Doing an exploratory first draft

### Process

1. **Load World Description**:
   - Read current world.md file
   - Identify all [NEEDS EXPANSION] markers
   - Note sections that feel thin or vague
   - Review character profiles for depth

2. **Generate Structured Questions**:
   
   For each underspecified element, generate 2-5 targeted questions following these categories:

   **Character Depth Questions**:
   - What formative event shaped this character's worldview?
   - What does this character fear most, and why?
   - What's a secret this character keeps?
   - How does this character's backstory connect to the central conflict?
   - What contradiction exists within this character's personality?

   **Setting Detail Questions**:
   - What does this location smell/sound/feel like?
   - What hidden areas or layers does this place have?
   - How has history shaped this location?
   - What daily rituals or customs occur here?
   - What makes this setting unique in your genre?

   **Conflict Clarification Questions**:
   - What makes this conflict personal for the protagonist?
   - What would happen if no one addressed this conflict?
   - Why can't this conflict be easily resolved?
   - What false solutions might characters try first?
   - How does this conflict test your theme?

   **World Rules Questions**:
   - What are the limits of this system?
   - What's the cost or consequence of using this?
   - How do ordinary people interact with this?
   - What happens when this rule is broken?
   - How did this rule come to exist?

   **Relationship Questions**:
   - What history do these characters share?
   - What do they want from each other?
   - What can't they say to each other, and why?
   - How does their relationship change over the story?
   - What would breaking this relationship cost?

3. **Present Questions Sequentially**:
   - Group questions by element (character, setting, conflict, etc.)
   - Present 3-5 questions at a time
   - Wait for user responses
   - Don't overwhelm with too many at once
   - Allow "skip" or "decide later" options

4. **Capture and Integrate Answers**:
   - Record responses in a clarifications section
   - Integrate details back into appropriate sections of world.md
   - Remove [NEEDS EXPANSION] markers as addressed
   - Add new details that emerge from answers
   - Maintain consistency with foundation (if exists)

5. **Iteration**:
   - After each round of questions, ask if user wants:
     * More depth on current element
     * Move to next element
     * Stop expansion (enough detail for now)
   
   - Continue until:
     * All [NEEDS EXPANSION] markers addressed
     * User feels ready to outline
     * Sufficient depth achieved for writing

6. **Document Expansions**:
   - Create `clarifications.md` in story directory
   - Log all questions asked and answers given
   - Note decisions made and rationale
   - Track evolution of story elements
   - Preserve for future reference

### Question Design Principles

**Avoid**:
- ❌ Yes/no questions that don't open discussion
- ❌ Questions with obvious "right" answers
- ❌ Implementation details (that's for writing phase)
- ❌ Questions that constrain creativity unnecessarily

**Prefer**:
- ✅ Open-ended questions that spark ideas
- ✅ "What if" scenarios
- ✅ Questions that connect elements
- ✅ Questions that reveal character motivation
- ✅ Questions that add texture and depth

### Example Question Sequences

**For Underdeveloped Character**:
1. "What's the worst thing that ever happened to [Character], and how did it change them?"
2. "What does [Character] want that they're afraid to admit even to themselves?"
3. "When [Character] is alone, what do they think about?"
4. "What's a physical habit or quirk that reveals [Character]'s inner state?"
5. "How does [Character] differ from who they appear to be publicly?"

**For Vague Setting**:
1. "If you walked through [Location] at different times of day, how would it change?"
2. "What story do the buildings/landscape tell about this place's history?"
3. "What do people love about [Location]? What do they hate?"
4. "What's hidden or forbidden in [Location]?"
5. "How do the five senses experience [Location]?"

**For Unclear Conflict**:
1. "Why is NOW the moment this conflict must be resolved?"
2. "What personal stakes does the protagonist have in this conflict?"
3. "What makes this conflict difficult rather than simple?"
4. "What would the world look like if the antagonist wins?"
5. "What painful choice will resolving this conflict require?"

### Output Updates

After expansion session:

1. **Update world.md**:
   - Integrate all new details
   - Remove addressed [NEEDS EXPANSION] markers
   - Add depth to character profiles
   - Enhance setting descriptions
   - Clarify conflicts and stakes

2. **Create clarifications.md**:
   - Document Q&A session
   - Note key decisions made
   - Track character development
   - Record world-building additions
   - Timestamp expansion session

3. **Validation**:
   - Verify world.md is more detailed
   - Check foundation consistency (if exists)
   - Ensure characters feel three-dimensional
   - Confirm setting is vivid
   - Validate conflict is compelling

4. **Report to User**:
   - Summarize expansions made
   - Highlight key details added
   - Note any remaining [NEEDS EXPANSION] (if any)
   - Confirm readiness for `/worldkit.outline`

## Error Handling

- **No world.md found**: Error - must run `/worldkit.worldbuild` first
- **No [NEEDS EXPANSION] markers**: Ask if user still wants to expand certain elements
- **User unsure of answer**: Offer to skip and revisit, or suggest alternatives
- **Contradictions with foundation**: Point out and help resolve

## Success Criteria

- All [NEEDS EXPANSION] markers addressed (or deliberately deferred)
- Characters have depth and complexity
- Setting is vivid and distinctive
- Conflicts are clear and compelling
- World rules are defined and consistent
- User feels confident to proceed to outline
- Clarifications documented for future reference

## Notes

This is an optional but highly recommended step for longer works (novels, series) where depth and consistency matter. For short stories or exploratory drafts, you might skip this and discover details during writing instead.
