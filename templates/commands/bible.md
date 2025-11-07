---
description: Generate and maintain a comprehensive story bible - automatically indexing characters, locations, timeline events, and tracking consistency across your manuscript.
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
   - Generate bible content in the configured language
   - Keep technical markers in English for consistency (file paths, section headers)
   - Maintain the template structure while translating the content

## Outline

This command creates and maintains a comprehensive "story bible" - a master reference document that indexes all story elements, tracks timelines, and helps identify inconsistencies. Think of it as an automatically-generated concordance for your fictional world.

### When to Use This Command

**Use `/worldkit.bible` when**:
- After completing multiple chapters
- Before starting a new writing session (to refresh context)
- When you suspect continuity errors
- Before sharing manuscript with beta readers
- During revision to catch inconsistencies
- After significant world.md updates

**Best timing**:
- After every 5-10 chapters written
- Before major revision passes
- When returning to project after a break
- Before querying agents (ensure consistency)

### Process

1. **Scan Project Files**:
   
   Load and analyze:
   - `world.md` - World foundation
   - `outline.md` - Story structure
   - `chapters.md` - Chapter breakdown
   - All character profiles from `/characters/` directory
   - `sensory-bank.md` if exists
   - Any written manuscript chapters

2. **Build Character Index**:
   
   For each character mentioned anywhere:
   
   **Character Entry**:
   - **Full Name**: [Including titles, aliases]
   - **First Appearance**: [Chapter/section]
   - **Role**: [Protagonist/Antagonist/Supporting/Minor]
   - **Key Traits**: [From character profiles or extracted]
   - **Relationships**: [Who they're connected to]
   - **Character Arc**: [Starting state → ending state]
   - **Appearances**: [List of chapters they appear in]
   - **Aliases/Names Used**: [Different names/titles used]
   - **Inconsistencies Found**: [Flag contradictions]

3. **Build Location Index**:
   
   For each location mentioned:
   
   **Location Entry**:
   - **Name**: [Official name and common names]
   - **Type**: [City/Building/Region/Landmark]
   - **First Mentioned**: [Chapter/section]
   - **Description Summary**: [Key features]
   - **Sensory Profile**: [Link to sensory bank if exists]
   - **Scenes Set Here**: [List of chapters/scenes]
   - **Notable Events**: [What happened here]
   - **Travel Connections**: [How to get there from other locations]
   - **Inconsistencies**: [E.g., described differently in different chapters]

4. **Build Timeline**:
   
   **Chronological Event List**:
   
   Extract all dated or sequenced events:
   
   **Backstory Events** (before story begins):
   - [Event]: [Date/timeframe], [Source: world.md/character profile]
   - [Event]: [Date/timeframe], [Source]
   
   **Story Events** (main narrative):
   - **Chapter 1**: [Date if known], [Key events]
   - **Chapter 2**: [Date if known], [Time elapsed since Ch 1], [Key events]
   - Continue for all chapters...
   
   **Inconsistency Checks**:
   - Character age vs. timeline events
   - Travel time between locations
   - Seasonal descriptions vs. time elapsed
   - Historical events referenced

5. **Build Object/Artifact Index**:
   
   Track important objects:
   
   **Object Entry**:
   - **Name**: [Magic sword, family heirloom, etc.]
   - **Description**: [Physical details]
   - **First Appearance**: [Where introduced]
   - **Current Location**: [Who has it/where is it]
   - **History**: [How it moved through story]
   - **Significance**: [Why it matters]
   - **Inconsistencies**: [Description changes, location errors]

6. **Build Terminology Index**:
   
   **World-Specific Terms**:
   - **[Term]**: Definition, first use, related terms
   - **[Term]**: Definition, first use, related terms
   
   **Magic System Terms**:
   - Rules and limitations
   - How terms are used
   - Consistency check
   
   **Cultural/Social Terms**:
   - Titles, ranks, customs
   - Usage consistency
   - Cultural context

7. **Track Information Reveals**:
   
   **The Revelation Tracker**:
   
   What readers know when:
   
   - **Chapter 1 Reader Knowledge**:
     * [Fact A revealed]
     * [Fact B revealed]
   
   - **Chapter 5 Reader Knowledge**:
     * [New fact C revealed]
     * [Confirms earlier hint about A]
   
   - **Chapter 10 Reader Knowledge**:
     * [Big reveal D]
     * [Recontextualizes fact A]
   
   **Check for**:
   - Information revealed too early
   - Information revealed too late
   - Reader knows something characters should know
   - Characters act on information not yet available

8. **Identify Inconsistencies**:
   
   **Automatic Checks**:
   
   **Physical Descriptions**:
   - Character appearance changes (eye color, height, etc.)
   - Location descriptions contradictory
   - Object properties different
   
   **Timeline Errors**:
   - Character age inconsistencies
   - Impossible travel times
   - Events out of sequence
   - Seasonal/weather contradictions
   
   **Capability Errors**:
   - Character knows something they shouldn't
   - Character forgets established skills
   - Magic rules violated
   - Technology inconsistently capable
   
   **Relationship Errors**:
   - Character A knows B in Ch 1, meets "for first time" Ch 5
   - Relationship depth inconsistent
   - Family relationships contradictory

9. **Cross-Reference System**:
   
   Create links between related elements:
   
   **Character → Locations**: Where they've been
   **Character → Character**: Relationships, interactions
   **Location → Events**: What happened there
   **Objects → Characters**: Who possessed them when
   **Terms → Chapters**: Where explained/used

### Output Structure

Create `{STORY_DIR}/story-bible.md`:

```markdown
# Story Bible: [Story Title]

**Generated**: [DATE]
**Project Files Analyzed**: world.md, outline.md, chapters.md, [X] character profiles, [Y] chapters written
**Last Updated**: [DATE]

---

## 📖 Quick Reference

**Total Characters**: [X]
**Total Locations**: [Y]
**Timeline Span**: [Start date] to [End date] ([X] days/months/years)
**Total Chapters**: [Written]/[Planned]

**Inconsistencies Found**: [X] ⚠️

---

## 👥 CHARACTER INDEX

### Protagonists

#### [Character Name]

- **Full Name/Titles**: [Complete name with titles, aliases]
- **First Appearance**: [Chapter X]
- **Role**: Protagonist
- **Age**: [X years old] (born [date/year])
- **Key Physical Traits**: [Height, coloring, distinguishing features]
- **Key Personality Traits**: [3-5 defining traits]
- **Character Arc**: [Starting state] → [Ending state/goal]
- **Relationships**:
  * [Character B]: [Nature of relationship]
  * [Character C]: [Nature of relationship]
- **Appears In**: Chapters [list]
- **Aliases Used**: [Any alternate names/identities]
- **Profile Link**: [Link to character.md if exists]
- **⚠️ Inconsistencies**: [None found / List any]

[Repeat for all protagonists]

### Antagonists

[Same structure]

### Supporting Characters

[Same structure]

### Minor Characters

[Abbreviated entries - name, role, first appearance, key trait]

---

## 🗺️ LOCATION INDEX

### Major Locations

#### [Location Name]

- **Type**: [City/Castle/Region/etc.]
- **First Mentioned**: [Chapter X]
- **Description**: [Brief summary of key features]
- **Sensory Profile**: [Link to sensory-bank.md entry if exists]
  * Signature Smell: [X]
  * Signature Sound: [Y]
  * Visual Identity: [Z]
- **Scenes Set Here**: [Chapter list]
- **Notable Events**:
  * [Event A - Chapter X]
  * [Event B - Chapter Y]
- **Connected To**: [Other locations, travel times]
- **⚠️ Inconsistencies**: [None / List]

[Repeat for all locations]

### Minor Locations

[Brief entries]

---

## 📅 TIMELINE

### Backstory (Before Story Begins)

**[X] years before story**:
- [Historical event] (Source: world.md)

**[Y] years before story**:
- [Protagonist born] (Source: character profile)

**[Z] months before story**:
- [Inciting incident backstory] (Source: outline.md)

### Main Story Timeline

#### Chapter 1: [Chapter Title]

- **Story Date**: [Day 1 / Specific date if known]
- **Time of Year**: [Season, weather]
- **Key Events**:
  * [Event A]
  * [Event B]
- **Characters Introduced**: [List]
- **Locations Introduced**: [List]
- **Information Revealed to Reader**: [What reader learns]

#### Chapter 2: [Chapter Title]

- **Story Date**: [Day 2 or specific]
- **Time Elapsed Since Previous Chapter**: [Hours/days]
- **Time of Year**: [Any changes]
- **Key Events**:
  * [Event A]
  * [Event B]
- **Information Revealed**: [What reader learns]

[Continue for all chapters]

#### Future Chapters (Planned)

[Outline-based timeline for unwritten chapters]

### Timeline Inconsistencies

- ⚠️ **Character Age Error**: [Character A] would be [X] in Chapter 5 based on birth date, but described as [Y]
- ⚠️ **Travel Time**: Journey from [A] to [B] takes 2 days in Ch 3, but 5 days in Ch 7
- ⚠️ **Seasonal**: Chapter 5 describes autumn leaves, but only 10 days have passed since spring in Ch 1

---

## 🗡️ OBJECT & ARTIFACT INDEX

### Major Objects

#### [Object Name - e.g., The Sword of Kings]

- **Description**: [Physical description, properties]
- **First Appearance**: [Chapter X]
- **Current Location**: [With Character A / At Location B]
- **History**:
  * Chapter X: [How introduced]
  * Chapter Y: [Passed to new owner]
  * Chapter Z: [Current status]
- **Significance**: [Why it matters to plot]
- **⚠️ Inconsistencies**: [None / List]

[Repeat for all important objects]

### Minor Objects

[Brief entries for less crucial items]

---

## 📚 TERMINOLOGY INDEX

### World-Specific Terms

- **[Term 1]**: [Definition], First use: [Chapter X], Related: [Terms]
- **[Term 2]**: [Definition], First use: [Chapter X], Related: [Terms]

### Magic System

- **[Magic concept]**: [How it works, limitations]
- **Rules**:
  1. [Rule 1]
  2. [Rule 2]
- **Uses in Story**: [Chapter references where used]
- **⚠️ Consistency**: [Any violations flagged]

### Social/Cultural Terms

- **[Title/Rank]**: [Meaning, who holds it, protocol]
- **[Custom]**: [Description, when practiced]

---

## 🔍 REVELATION TRACKER

### What Reader Knows By Chapter

**End of Chapter 1**:
- [Reader knows A]
- [Reader suspects B]
- [Reader doesn't know C (will learn later)]

**End of Chapter 5**:
- [Now knows C]
- [Confirmed suspicion about B]
- [New mystery D introduced]

**End of Chapter 10**:
- [Big reveal about A that recontextualizes everything]

### Information Flow Check

- ✅ **Good Pacing**: Major reveal in Ch 8 set up in Ch 2, 4, 6
- ⚠️ **Too Early**: Character motivation revealed in Ch 1, reduces tension
- ⚠️ **Too Late**: World rule explained Ch 12, but needed in Ch 3 to make sense

---

## ⚠️ INCONSISTENCY REPORT

### 🚨 High Priority (Story-Breaking)

1. **Timeline Error - Character Age**:
   - **Issue**: [Description]
   - **Locations**: [Chapters where contradiction occurs]
   - **Fix Required**: [Suggested resolution]

2. **Impossible Knowledge**:
   - **Issue**: Character A acts on information revealed later
   - **Locations**: [Chapters]
   - **Fix Required**: [Add earlier reveal or remove knowledge]

### ⚠️ Medium Priority (Noticeable)

1. **Physical Description Change**:
   - **Issue**: Eye color changes
   - **Locations**: Ch 2 (blue), Ch 8 (green)
   - **Fix Required**: Standardize

### ℹ️ Low Priority (Polish)

1. **Minor Continuity**:
   - **Issue**: [Small detail inconsistent]
   - **Fix**: [Optional correction]

---

## 🔗 CROSS-REFERENCE TABLES

### Character-Location Matrix

| Character | Ch1 Location | Ch5 Location | Ch10 Location |
|-----------|--------------|--------------|---------------|
| [Name A] | [Place X] | [Place Y] | [Place Z] |
| [Name B] | [Place X] | [Place X] | [Place Y] |

### Character Interaction Matrix

| Character | Knows/Met | Relationship Type | First Interaction | Status Ch 10 |
|-----------|-----------|-------------------|-------------------|--------------|
| A & B | Ch 1 | Allies | Ch 1 | [Current] |
| A & C | Ch 5 | Enemies | Ch 5 | [Current] |

### Object Possession Chain

| Object | Ch 1-3 | Ch 4-7 | Ch 8-10 | Current |
|--------|--------|--------|---------|---------|
| [Sword] | [Owner A] | [Stolen by B] | [Recovered] | [Owner A] |

---

## 📊 USAGE STATISTICS

### Character Appearances by Chapter

| Character | Total Appearances | POV Chapters | Major Role | Supporting | Mentioned Only |
|-----------|-------------------|--------------|------------|------------|----------------|
| [Name] | 15 | 8 | 5 | 2 | 0 |

### Location Usage

| Location | Scenes Set Here | First Use | Last Use | Importance |
|----------|-----------------|-----------|----------|------------|
| [Place] | 12 | Ch 1 | Ch 15 | Major |

### Plot Thread Tracking

| Thread | Introduced | Active Chapters | Resolved | Status |
|--------|------------|-----------------|----------|--------|
| [Thread A] | Ch 1 | 1-5, 8-10 | Ch 10 | Complete |
| [Thread B] | Ch 3 | 3-15 | Not yet | Ongoing |

---

## 💡 WRITING REMINDERS

### Character Consistency

- [Character A] always [habit/trait]
- [Character B] never [would not do X]
- [Character C] relationship with D is [complex dynamic]

### World Rules

- Magic costs [X]
- Technology cannot [Y]
- Social rule: [Z]

### Ongoing Mysteries

- Reader still doesn't know: [A]
- Will be revealed: [Chapter X]
- Foreshadow in: [Chapter Y]

---

## 🔄 UPDATE LOG

- **[DATE]**: Initial bible generated from outline and world.md
- **[DATE]**: Updated after writing chapters 1-5
- **[DATE]**: Added character C profile, fixed timeline inconsistency
- **[DATE]**: Full revision after completing first draft

```

## Best Practices

**Do**:
- ✅ Update bible after every 5-10 chapters written
- ✅ Fix flagged inconsistencies promptly
- ✅ Use as reference before writing new chapters
- ✅ Share with beta readers for continuity checks
- ✅ Add custom sections for your project's unique needs
- ✅ Link to detailed files (character profiles, sensory bank)

**Don't**:
- ❌ Ignore flagged inconsistencies
- ❌ Let bible get outdated (stale reference is worse than none)
- ❌ Use as a writing requirement (it's a tool, not a checklist)
- ❌ Over-index minor details that don't affect story
- ❌ Treat inconsistencies as failures (they're normal, just fix them)

## Error Handling

- **No source files found**: Create skeleton bible, populate as you write
- **Contradictions in world.md itself**: Flag and ask for resolution
- **Too many inconsistencies**: Prioritize by severity, fix high-priority first
- **Missing information**: Note gaps, fill in as discovered

## Success Criteria

- All characters, locations, objects indexed
- Complete timeline from backstory through current chapters
- Cross-references functional
- Inconsistencies identified and prioritized
- Easy to find any story element quickly
- Updated regularly (not stale)
- Actually useful when writing/revising
- Catches errors before readers do

## Notes

**This is a living document**
Update it as you write. A story bible is only valuable if it's current.

**Not every detail belongs here**
Focus on elements that:
- Appear multiple times
- Could create continuity errors
- Readers will notice if inconsistent
- You might forget between chapters

**Severity of inconsistencies**:
- **High**: Story-breaking, timeline impossible, character knowledge errors
- **Medium**: Reader will notice (physical descriptions, relationships)
- **Low**: Author might notice on reread (minor details)

**How much is too much?**
- For 50k word novel: 5-10 page bible
- For 100k word novel: 10-20 page bible
- For series: 30-50 page bible per book
- Expand based on complexity, not word count

**When to create**:
- Start simple after outlining
- Expand significantly after first draft
- Make comprehensive before querying
- Essential for series work
