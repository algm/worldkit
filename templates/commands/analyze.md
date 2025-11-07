---
description: Perform cross-element consistency and quality analysis across world.md, outline.md, and chapters.md.
scripts:
  sh: scripts/bash/check-prerequisites.sh --json --require-tasks --include-tasks
  ps: scripts/powershell/check-prerequisites.ps1 -Json -RequireTasks -IncludeTasks
---

## User Input

```text
$ARGUMENTS
```

You **MUST** consider the user input before proceeding (if not empty).

## Goal

Identify inconsistencies, continuity errors, plot holes, and underspecified elements across the three core documents (`world.md`, `outline.md`, `chapters.md`) before writing. This command should run after `/worldkit.chapters` has successfully produced a complete `chapters.md`.

## Operating Constraints

**STRICTLY READ-ONLY**: Do **not** modify any files. Output a structured analysis report. Offer an optional remediation plan (user must explicitly approve before any follow-up editing).

**Foundation Authority**: The world foundation (`/memory/foundation.md`) is **non-negotiable** within this analysis scope. Foundation conflicts are automatically CRITICAL and require adjustment of the world, outline, or chapters—not reinterpretation or ignoring of established rules.

## Execution Steps

### 1. Initialize Analysis Context

Run `{SCRIPT}` once from repo root and parse JSON for STORY_DIR and AVAILABLE_DOCS. Derive absolute paths:

- WORLD = STORY_DIR/world.md
- OUTLINE = STORY_DIR/outline.md
- CHAPTERS = STORY_DIR/chapters.md
- FOUNDATION = /memory/foundation.md (if exists)

Abort with error message if any required file is missing.

### 2. Load Story Elements

**From world.md:**
- Characters (names, traits, motivations, arcs)
- Settings (locations, geography, culture)
- Conflicts (external and internal)
- Themes
- World Rules (magic systems, technology, etc.)

**From outline.md:**
- Act structure
- Major plot points
- Character arcs
- Subplot outlines
- Theme integration

**From chapters.md:**
- Chapter breakdown
- Scene details
- POV distribution
- Pacing

**From foundation.md (if exists):**
- Established world rules
- Core foundation elements
- Consistency requirements

### 3. Consistency Analysis

#### A. Foundation Consistency Check

For each foundation rule:
- [ ] Is it respected in world.md?
- [ ] Does outline.md violate any rules?
- [ ] Do chapter scenes follow established rules?
- [ ] Are magic/technology uses consistent?

**Output**: List any foundation violations with:
- Element that violates
- Specific rule violated
- Location (file, section)
- Severity (Critical/Major/Minor)

#### B. Character Consistency Check

For each main character:
- [ ] Physical descriptions match across documents?
- [ ] Motivations consistent?
- [ ] Character voice maintained?
- [ ] Arc progression logical?
- [ ] Actions consistent with established traits?
- [ ] Relationships tracked consistently?

**Output**: Character consistency report with any discrepancies found.

#### C. Plot Continuity Check

- [ ] All plot points from outline appear in chapters?
- [ ] Scene order makes logical sense?
- [ ] Cause and effect relationships clear?
- [ ] No plot holes or logical gaps?
- [ ] All setups have payoffs?
- [ ] Timeline is consistent?

**Output**: Plot continuity issues with specific locations.

#### D. Setting Consistency Check

For each location:
- [ ] Physical descriptions match?
- [ ] Geography makes sense?
- [ ] Cultural elements consistent?
- [ ] Technology/magic level maintained?
- [ ] Historical references align?

**Output**: Setting inconsistencies found.

#### E. Theme Tracking

- [ ] Themes from world.md are explored in outline?
- [ ] Chapter scenes support thematic development?
- [ ] Theme integration feels natural, not forced?
- [ ] Thematic resolution aligns with ending?

**Output**: Theme integration analysis.

### 4. Quality Analysis

#### A. Completeness Check

**Characters**:
- [ ] All major characters have clear motivations?
- [ ] Character arcs are complete?
- [ ] Supporting characters serve clear purposes?

**Plot**:
- [ ] Beginning, middle, end all present?
- [ ] Climax is clearly defined?
- [ ] All conflicts are resolved (or deliberately left open)?

**Scenes**:
- [ ] All scenes have Goal-Conflict-Outcome?
- [ ] Each scene serves a purpose?
- [ ] Pacing is appropriate?

**Output**: Completeness gaps identified.

#### B. Depth Analysis

- Are characters three-dimensional or flat?
- Is setting vivid or generic?
- Are conflicts compelling or weak?
- Do themes emerge naturally or feel tacked on?

**Output**: Depth assessment with suggestions.

#### C. Genre Convention Check

Based on stated genre:
- [ ] Story follows or deliberately subverts genre conventions?
- [ ] Tone is consistent?
- [ ] Pacing appropriate for genre?
- [ ] Reader expectations addressed?

**Output**: Genre alignment analysis.

### 5. Generate Analysis Report

Create detailed report in `STORY_DIR/analysis-report.md`:

```markdown
# Story Analysis Report

**Story**: [Name]
**Date**: [Date]
**Status**: [Summary - Ready/Needs Revision/Major Issues]

## Executive Summary

[3-4 sentence overview of analysis results]

## Critical Issues (Must Fix)

[Issues that break foundation rules or create plot holes]

## Major Issues (Should Fix)

[Significant inconsistencies or quality concerns]

## Minor Issues (Consider Fixing)

[Small inconsistencies or optimization opportunities]

## Strengths

[Elements that are working well]

## Foundation Consistency: [PASS/FAIL]

[Details of foundation check]

## Character Consistency: [PASS/NEEDS WORK]

[Character analysis details]

## Plot Continuity: [PASS/NEEDS WORK]

[Plot continuity findings]

## Setting Consistency: [PASS/NEEDS WORK]

[Setting consistency findings]

## Theme Integration: [STRONG/ADEQUATE/WEAK]

[Theme tracking results]

## Completeness Score: [X/100]

[Breakdown of completeness metrics]

## Recommendations

1. [Priority 1 recommendation]
2. [Priority 2 recommendation]
3. [Priority 3 recommendation]

## Optional Remediation Plan

[If issues found, outline steps to fix them]
```

### 6. Present Report to User

Show key findings:
- Critical issues count
- Major issues count
- Overall readiness assessment
- Top 3 recommendations

Ask user if they want to:
- Review full report
- Proceed with writing anyway
- Request remediation suggestions
- Make fixes before proceeding

## Error Handling

- **Missing Files**: Identify which prerequisite command to run
- **Malformed Documents**: Point out sections that couldn't be parsed
- **Empty Sections**: Flag as potential gaps to fill

## Success Criteria

- All three documents analyzed
- Consistency checked against foundation
- Specific issues identified with locations
- Clear remediation priorities provided
- User knows exact next steps

## Notes

This analysis is a quality gate before writing. It catches problems early when they're easier to fix than during or after writing. However, it's not required—some writers prefer to discover and fix issues during revision.
